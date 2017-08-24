FROM debian:stretch

MAINTAINER niklaus.giger@member.fsf.org

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ruby-full
# RUN apt-get builddep -y ruby-full

# RUN apt-get clean && rm -rf /var/cache/apt
RUN mkdir /home/currency && gem install bundler && gem install currency

