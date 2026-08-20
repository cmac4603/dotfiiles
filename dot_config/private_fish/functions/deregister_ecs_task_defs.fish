function deregister-ecs-task-defs --description "Deregister and delete all ECS task definitions for a given family prefix"
    set -l family_prefix $argv[1]

    if test -z "$family_prefix"
        echo "Usage: deregister-ecs-task-defs <family-prefix>"
        return 1
    end

    set -lx AWS_PROFILE std-app-nonprod

    # Step 1: Deregister all ACTIVE task definitions (makes them INACTIVE)
    echo "Step 1: Deregistering all ACTIVE task definitions for '$family_prefix'..."
    set -l next_token ""
    set -l deregistered 0

    while true
        set -l cmd aws ecs list-task-definitions \
            --family-prefix $family_prefix \
            --status ACTIVE \
            --max-items 100 \
            --query '{arns: taskDefinitionArns, token: NextToken}' \
            --output json

        if test -n "$next_token"
            set cmd $cmd --starting-token $next_token
        end

        set -l result ($cmd)

        for arn in (echo $result | jq -r '.arns[]? // empty')
            echo "Deregistering: $arn"
            aws ecs deregister-task-definition --task-definition $arn --no-cli-pager >/dev/null
            set deregistered (math $deregistered + 1)
        end

        set next_token (echo $result | jq -r '.token // empty')
        if test -z "$next_token"
            break
        end

        echo "  ...deregistered $deregistered so far, fetching next page..."
    end

    echo "Step 1 complete: deregistered $deregistered task definitions."

    # Step 2: Delete all INACTIVE task definitions in batches of 10
    echo "Step 2: Deleting all INACTIVE task definitions for '$family_prefix'..."
    set next_token ""
    set -l deleted 0

    while true
        set -l cmd aws ecs list-task-definitions \
            --family-prefix $family_prefix \
            --status INACTIVE \
            --max-items 10 \
            --query '{arns: taskDefinitionArns, token: NextToken}' \
            --output json

        if test -n "$next_token"
            set cmd $cmd --starting-token $next_token
        end

        set -l result ($cmd)

        set -l batch (echo $result | jq -r '.arns[]? // empty')
        if test -z "$batch"
            break
        end

        echo "Deleting batch..."
        aws ecs delete-task-definitions --task-definitions $batch --no-cli-pager >/dev/null
        set deleted (math $deleted + (count $batch))

        set next_token (echo $result | jq -r '.token // empty')
        if test -z "$next_token"
            break
        end

        echo "  ...deleted $deleted so far, fetching next page..."
    end

    echo "Step 2 complete: deleted $deleted task definitions."
    echo "Done."
end
