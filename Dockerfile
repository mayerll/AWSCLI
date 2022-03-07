FROM ubuntu:14.04

ENV AWS_DEFAULT_REGION='[replace it by your region]'
ENV AWS_ACCESS_KEY_ID='[replace it by your access key id]'
ENV AWS_SECRET_ACCESS_KEY='[replace it by your secret]'

ENV AWS_ELASTICACHE_ENDPOINT='[replace it by the Elasticache endpoint]'
ENV AWS_DYNAMODB_ENDPOINT='[replace it by the DynamoDB endpoint]'

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget make gcc && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install bash vim curl wget

RUN cd /tmp
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

RUN cd /tmp &&\
    curl http://download.redis.io/redis-stable.tar.gz | tar xz &&\
    make -C redis-stable &&\
    cp redis-stable/src/redis-cli /usr/local/bin &&\
    rm -rf /tmp/redis-stable

COPY . .

#CMD ["sleep", "100000"] #Debugging
CMD ["./src/dynamodb/run-test.sh"]

