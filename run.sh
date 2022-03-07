docker build . -t mayerlbp/awscli:v10.0.0
docker push mayerlbp/awscli:v10.0.0

kubectl create deployment --image=mayerlbp/awscli:v10.0.0 aws-app

kubectl set env deployment/aws-app AWS_ACCESS_KEY_ID='replace it' 
kubectl set env deployment/aws-app AWS_SECRET_ACCESS_KEY='replace it'
kubectl set env deployment/aws-app AWS_DEFAULT_REGION='us-west-2' 
kubectl set env deployment/aws-app AWS_ELASTICACHE_ENDPOINT='replace it' 
