# AWSCLI

Please refer to the following information to deploy a basic deployment on Elastic Kubernetes Cluster and run unit tests by AWS CLI

1 Run the following commands to bake the image:

    docker build . -t mayerlbp/awscli:v10.0.0
    docker push mayerlbp/awscli:v10.0.0
  
![alt text](https://github.com/mayerll/AWSCLI/blob/main/image/pic5.png?raw=true)

2 Connect to Elastic Kubernets Cluster and deploy image:
(please replace the string 'replace it' with the correct value.)

    $kubectl create deployment --image=mayerlbp/awscli:v10.0.0 aws-app

    $kubectl set env deployment/aws-app AWS_ACCESS_KEY_ID='replace it' 
    $kubectl set env deployment/aws-app AWS_SECRET_ACCESS_KEY='replace it'
    $kubectl set env deployment/aws-app AWS_DEFAULT_REGION='us-west-2' 
    $kubectl set env deployment/aws-app AWS_ELASTICACHE_ENDPOINT='replace it' 
    
3 Check the status of the deployment aws-app:

    $kubectl get deploy
    $kubectl get pod
    

