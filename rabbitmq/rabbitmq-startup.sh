#!/bin/bash

serf join $SERF_1_PORT_7946_TCP_ADDR:$SERF_1_PORT_7946_TCP_PORT

MASTER_IP="${MASTER_PORT_5672_TCP_ADDR}"
MASTER_HOSTNAME="master"

MASTER_NODENAME="rabbit@${MASTER_IP}"
if [ -z $MASTER_IP ]; then
	MYIP=$( ip a s|grep 'inet '|grep -v '127.0.0.1'|awk '{print $2;}'|awk 'BEGIN {FS="/"} {print $1;}')
	MYNODENAME="rabbit@${MYIP}"
	echo "Running RabbitMQ server as standalone node using nodename ${MYNODENAME}.";
	cp /usr/lib/rabbitmq/bin/rabbitmq-server /usr/lib/rabbitmq/bin/rabbitmq-server-copy
	sed -i 's/sname ${RABBITMQ_NODENAME}/name ${RABBITMQ_NODELONGNAME}/' /usr/lib/rabbitmq/bin/rabbitmq-server
	export RABBITMQ_NODELONGNAME="${MYNODENAME}"
	rabbitmq-server
	/bin/bash
else
	echo "Joining cluster to ${MASTER_IP}"
	rabbitmq-server -detached
	rabbitmqctl stop_app
	echo "${MASTER_IP} ${MASTER_HOSTNAME}" >> /etc/hosts
	rabbitmqctl join_cluster ${MASTER_NODENAME}
	rabbitmqctl stop
	rabbitmq-server
fi;
