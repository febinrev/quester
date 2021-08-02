FROM ubuntu:latest

LABEL maintainer="Febin"
LABEL version="1.2.1"

ENV TERM xterm

WORKDIR /root/

RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install jq -y 

COPY ./quester.sh /root/quester.sh

RUN chmod +x /root/quester.sh

RUN mkdir /scripts
COPY dockerinit.sh /scripts/start.sh

RUN chmod +x /scripts/start.sh


ENTRYPOINT ["/scripts/start.sh"]
