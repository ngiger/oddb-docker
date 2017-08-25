FROM debian:stretch

MAINTAINER niklaus.giger@member.fsf.org

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ruby-full
RUN apt-get update && apt-get install -y git
RUN mkdir /var/www
RUN useradd --create-home --shell /bin/bash migeld
# RUN adduser --disabled-password --gecos '' migeld
RUN mkdir -p /var/www/migel && chown -R migeld:migeld /var/www/migel
ADD assets/sources.list /etc/apt/sources.list.d/sources.list
RUN apt-get update 
RUN apt-get -y install postgresql-server-dev-9.6 ruby-bundler ruby-sequel ruby-sequel-pg && apt-get -y build-dep ruby-sequel ruby-sequel-pg ruby-full
RUN apt-get -y install ruby-nokogiri ruby-spreadsheet && apt-get -y build-dep ruby-nokogiri ruby-spreadsheet
RUN apt-get -y install ruby-libxml && apt-get -y build-dep ruby-libxml
RUN gem install rclconf
WORKDIR /var/www/migel
RUN chown -R migeld /var/www/migel
USER migeld 
RUN git clone https://github.com/ngiger/migel.git .
RUN find . -name migeld
RUN bundle install --path vendor --without development debugger

