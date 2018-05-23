FROM ubuntu:xenial

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y ubuntu-dev-tools 

ADD scripts/*.sh /usr/local/bin
RUN chmod +x /usr/local/bin/*.sh

