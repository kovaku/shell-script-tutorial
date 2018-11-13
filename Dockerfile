FROM ubuntu:latest
MAINTAINER kovaku@gmail.com

RUN apt-get update
RUN apt-get install -y curl jq

RUN mkdir weather
WORKDIR weather

COPY app.sh .
RUN chmod 744 app.sh

ENTRYPOINT ["bash","/weather/app.sh"]