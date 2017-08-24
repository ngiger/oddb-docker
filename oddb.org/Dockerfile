FROM debian:stretch

MAINTAINER niklaus.giger@member.fsf.org

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ruby-full
RUN apt-get update && apt-get install -y git
RUN mkdir /var/www
RUN useradd --create-home --shell /bin/bash oddb
# RUN adduser --disabled-password --gecos '' oddb
RUN mkdir -p /var/www/oddb.org && chown -R oddb:oddb /var/www/oddb.org
ADD assets/sources.list /etc/apt/sources.list.d/sources.list
RUN apt-get update
ENV RUBY_PACKS postgresql-server-dev-all ruby-bundler ruby-sequel ruby-sequel-pg ruby-nokogiri ruby-spreadsheet ruby-libxml imagemagick ruby-rmagick
RUN cat /etc/apt/sources.list /etc/apt/sources.list.d/sources.list
RUN apt-get update && apt-get -y install $RUBY_PACKS && apt-get -y build-dep $RUBY_PACKS 
USER oddb
WORKDIR /var/www/oddb.org
RUN git clone https://github.com/zdavatz/oddb.org.git .
# USER root
# RUN apt-get -y install ruby-libxml ruby-rmagick
# RUN apt-get update && apt-get -y build-dep ruby-libxml imagemagick ruby-rmagick
# USER oddb
RUN bundle install --path vendor --without development debugger; \
 cat /var/www/oddb.org/vendor/ruby/2.3.0/extensions/x86_64-linux/2.3.0/rmagick-2.13.4/mkmf.log ; \
 cat /var/www/oddb.org/vendor/ruby/2.3.0/extensions/x86_64-linux/2.3.0/rmagick-2.13.4/gem_make.out
 

 # USE --no-install-recommends
 # ~/.gemrc
 # ---
# gem: --no-ri --no-rdoc
