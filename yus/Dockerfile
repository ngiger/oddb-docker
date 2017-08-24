from postgres:9.6

MAINTAINER niklaus.giger@member.fsf.org

RUN localedef -i de_CH -c -f UTF-8 -A /usr/share/locale/locale.alias de_CH.UTF-8
ENV LANG de_CH.utf8

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ruby-full
ADD assets/sources.list /etc/apt/sources.list.d/sources.list
RUN apt-get update 
RUN apt-get -y build-dep ruby-full
RUN apt-get -y install postgresql-server-dev-9.6

# RUN apt-get clean && rm -rf /var/cache/apt
RUN mkdir /home/yus && gem install bundler && gem install yus

ADD assets/init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh 
