FROM debian:stretch

MAINTAINER niklaus.giger@member.fsf.org

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y  --no-install-recommends locales-all ruby-full postgresql-client postgresql-server-dev-9.6
ADD assets/sources.list /etc/apt/sources.list.d/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends locales ruby-pg && apt-get -y build-dep ruby-pg
RUN localedef -i de_CH -c -f UTF-8 -A /usr/share/locale/locale.alias de_CH.UTF-8
ENV LANG de_CH.utf8
WORKDIR /home/yus
RUN gem install bundler --no-ri --no-rdoc yus
# ADD assets/init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
CMD yusd
# RUN apt-get clean && rm -rf /var/cache/apt
