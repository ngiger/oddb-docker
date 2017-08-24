FROM debian:stretch

MAINTAINER niklaus.giger@member.fsf.org

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ruby-full
RUN mkdir /home/currency && gem install bundler && gem install ycurrency rclconf
WORKDIR /home/currency
CMD currencyd

