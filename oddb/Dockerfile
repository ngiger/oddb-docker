FROM debian:stretch

MAINTAINER niklaus.giger@member.fsf.org

ENV DEBIAN_FRONTEND=noninteractive

ENV RUBY_PACKS git postgresql-server-dev-all ruby-full ruby-bundler ruby-sequel ruby-sequel-pg ruby-nokogiri ruby-spreadsheet ruby-libxml imagemagick ruby-rmagick \
    # install some packes handy for debugging
    postgresql-client vim-nox
    
ADD assets/sources.list /etc/apt/sources.list.d/sources.list
RUN apt-get update && apt-get -y --no-install-recommends build-dep $RUBY_PACKS && \
  apt-get -y --no-install-recommends install $RUBY_PACKS

RUN mkdir /var/www
RUN useradd --create-home --shell /bin/bash oddb
RUN mkdir -p /var/www/oddb.org && chown -R oddb:oddb /var/www/oddb.org
USER oddb
WORKDIR /var/www/oddb.org
RUN git clone https://github.com/ngiger/oddb.org.git .
# Work around a problem, that we want to install a more current version of rmagick and pg
RUN rm Gemfile.lock
RUN git checkout -b docker origin/docker
RUN bundle install --path vendor --without development test
USER root

# should we install apache2 and/or nginx?
# ADD etc/20_oddb.org.rack.conf /etc/apache2/sites-enabled/20_oddb.org.rack.conf
# ADD assets/nginx.conf /etc/nginx/sites-enabled/oddb.conf
# RUN a2enmod rewrite
# RUN echo 'pgoddborg:5432:oddb:postres:example' >/root/.pgpass && chmod 0600 /root/.pgpass

# hostname:port:database:username:password
RUN apt-get autoremove && rm -rf /var/lib/apt/lists/*
