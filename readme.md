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

Port the following services. Probably in this order

* yus (port 12005) # Braucht Dateien in /etc/yus.oddb
* currency (port 10999)
* migeld (port 33000)

* ch.oddb-fiparse (port 10002)
* ch.oddb-export (port 10005)
* ch.oddb-swissindex_pharma
* ch.oddb-swissreg (port 10007)
* ch.oddb (port 10000)
* ch.oddb-meddata (port 10006)

* oddb_crawler (port 1001)
* oddb_google_crawler (port 1008)
* ch.oddb-refdata

Vorgehen beim Importieren

## Protocol setup

Import daily did have to many errors, therefore fixed a few problem with missing atc-code. Then I was able to run `bundle exec ruby jobs/import_swissmedic_only`. Duration ? hours.
