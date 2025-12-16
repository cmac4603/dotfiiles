# Login to public and private ECR repos
function awsecr
    echo "Logging into public ECR..."
    aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
    # aws ecr-public get-login-password --region us-east-1 | podman login --username AWS --password-stdin public.ecr.aws
    echo -e "\nLogging into private ECR..."
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 451479211471.dkr.ecr.us-east-1.amazonaws.com
    # aws ecr get-login-password --region us-east-1 | podman login --username AWS --password-stdin 451479211471.dkr.ecr.us-east-1.amazonaws.com
end
