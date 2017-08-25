# Purpose

Setup an infrastructure which can be easily duplicated to run test (unit-tests and Watir). Based on "docker":https://www.docker.com/ and "docker-compose":https://docs.docker.com/compose/.

As some of the tests take many hours to complete, eg. check the whole import_daily it is desirable that the developer has the possibility to run several of these test in parallel. This will allow working on a feature branch and fixing some (hopefully small) problem in the production branch.

The work is based on https://github.com/ngiger/vagrant-oddb_org and the accumulated experience of the last 2 and half year.

It is unclear if and upto which extent we reuse the puppet modules.

## Design decisions

* Move from vagrant to docker to speed up running a server (going down from minutes to seconds).

## installation

Upcoming

## TODO

* Fix problem that I cannot directly access the 8212 as specified in the docker-compose.yml

I have the following problem 
    > wget -v http://127.0.0.1:8212
    --2017-08-25 11:47:35--  http://127.0.0.1:8212/
    Connecting to 127.0.0.1:8212... connected.
    HTTP request sent, awaiting response... Read error (Connection reset by peer) in headers.
    Retrying.

* To fix problems like the above, find and a document a way to call rackup manually inside the docker

* To we need an nginx/apache inside the docker (e.g. to speed up caching files?)

* Load yus/migel/oddb from scratch
* Document the needed yml (add for each *.yml a *.example?) for setup
** ./yus/assets/yus.yml
** ./migeld/etc/migel.yml
** ./oddb.org/etc/oddb.yml

* Document and/or install automatically correct dojo version (http://download.dojotoolkit.org/release-1.12.2/dojo-release-1.12.2.zip)

## Protocol setup

### 24.08.2017

Import daily did have to many errors, therefore fixed a few problem with missing atc-code. Then I was able to run `bundle exec ruby jobs/import_swissmedic_only`. Duration ? hours.

As after 977 of around 18000 lines I already had over 3.7 GB of logs, I decided to stop, produce less output and try to load an existing database. Also had many entries like `Could not create: :!1!galenic_form., reason: :!1!galenic_form. -> OddbPrevalence::galenic_group(1) returned nil`

Added files to load and dump the databases in bin.

All needed services for oddb are starting up, after I added the database dump

Here some ideas on howto proxy docker and ngins
* https://hub.docker.com/r/jwilder/nginx-proxy/
* http://jasonwilder.com/blog/2014/03/25/automated-nginx-reverse-proxy-for-docker/
* https://stackoverflow.com/questions/43598121/docker-networking-reverse-proxy-without-docker-compose

