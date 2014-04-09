Introduction
============

Docker container for RabbitMQ 3.3.x with ability to form cluster

Usage
=====

Master
------

`docker run -p 5672:5672 -p 15672:15672 --name="rmq1" fhalim/rabbitmq`

Additional nodes
----------------

`docker run --link=rmq1:master fhalim/rabbitmq`
