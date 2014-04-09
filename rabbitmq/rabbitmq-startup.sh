#!/bin/sh
MASTER_IP="${MASTER_PORT_5672_TCP_ADDR}"

if [ -z $MASTER_IP ]; then
	echo "Running RabbitMQ server as standalone node";
	rabbitmq-server
else
	echo "Joining cluster to ${MASTER_IP}"
	rabbitmq-server -detached
	rabbitmqctl stop_app
	rabbitmqctl join_cluster --ram rabbit@$MASTER_IP
	rabbitmqctl stop
	rabbitmq-server
fi;
