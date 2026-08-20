function branch_up_to_date --description "Check whether the current GitHub branch is behind the default branch"
    set -l default_branch (gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name')
    or return 2

    set -l branch (git branch --show-current)
    or return 2

    if test -z "$branch"
        echo "Unable to determine the current branch." >&2
        return 2
    end

    set -l behind (gh api "repos/{owner}/{repo}/compare/$default_branch...$branch" --jq '.behind_by')
    or return 2

    if test "$behind" -gt 0
        echo "$branch is $behind commit(s) behind $default_branch; rebase needed."
        return 1
    end

    echo "$branch is up to date with $default_branch."
    return 0
end
