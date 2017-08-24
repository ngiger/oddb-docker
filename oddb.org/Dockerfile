FROM debian:stretch

MAINTAINER niklaus.giger@member.fsf.org

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ruby-full
RUN apt-get update && apt-get install -y git
RUN mkdir /var/www
RUN useradd --create-home --shell /bin/bash oddb
RUN mkdir -p /var/www/oddb.org && chown -R oddb:oddb /var/www/oddb.org
ADD assets/sources.list /etc/apt/sources.list.d/sources.list
RUN apt-get update
ENV RUBY_PACKS postgresql-server-dev-all ruby-bundler ruby-sequel ruby-sequel-pg ruby-nokogiri ruby-spreadsheet ruby-libxml imagemagick ruby-rmagick
RUN cat /etc/apt/sources.list /etc/apt/sources.list.d/sources.list
RUN apt-get update && apt-get -y install $RUBY_PACKS && apt-get -y build-dep $RUBY_PACKS 
USER oddb
WORKDIR /var/www/oddb.org
RUN git clone https://github.com/zdavatz/oddb.org.git .
# Work around a problem, that we want to install a more current version of rmagick and pg
RUN rm Gemfile.lock
RUN git checkout Gemfile && awk '/rmagick|pg/{gsub(/,/, "# ,")};{print}' Gemfile > Gemfile.new && grep pg Gemfile.new && mv Gemfile.new Gemfile
RUN bundle install --path vendor --without development debugger test
