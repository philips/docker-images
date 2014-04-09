FROM centos
MAINTAINER Fawad Halim <fawad@fawad.net>

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install erlang
RUN yum -y install logrotate
RUN rpm -Uvh https://www.rabbitmq.com/releases/rabbitmq-server/v3.3.0/rabbitmq-server-3.3.0-1.noarch.rpm
RUN rabbitmq-plugins enable rabbitmq_management
RUN rabbitmq-plugins enable rabbitmq_federation
RUN rabbitmq-plugins enable rabbitmq_federation_management

ADD rabbitmq-startup.sh /usr/local/sbin/rabbitmq-startup.sh
RUN chmod 700 /usr/local/sbin/rabbitmq-startup.sh

CMD /usr/local/sbin/rabbitmq-startup.sh

EXPOSE 5672 15672

