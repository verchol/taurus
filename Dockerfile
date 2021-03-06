FROM debian:latest

RUN apt-get update
RUN apt-get install -y python default-jre-headless python-tk python-pip python-dev libxml2-dev libxslt-dev zlib1g-dev
RUN pip install bzt
RUN pip install --upgrade bzt

COPY ./init.yml /scripts/init.yml

RUN bzt scripts/init.yml -report

COPY . /scripts

WORKDIR /scripts



CMD ["bzt" , "letschat.yml", "-report"]

