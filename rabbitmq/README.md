Introduction
============

Docker container for RabbitMQ 3.3.x with ability to form cluster

Usage
=====

Start a Serf master using

`SERF_ID=$(docker run -d --name serf_1 -p 7946 -p 7373 ctlc/serf /run.sh)`

Master
------

`docker run -p 5672:5672 -p 15672:15672 --name="rmq1" fhalim/rabbitmq`

Additional nodes
----------------

`docker run --link=rmq1:master fhalim/rabbitmq`
