FROM busybox
MAINTAINER Brandon Philips <brandon@ifup.org>

ADD https://dl.bintray.com/mitchellh/consul/0.2.0_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/bin && \
	unzip /tmp/consul.zip
CMD /usr/bin/consul agent -server -data-dir=/tmp/consul -client=0.0.0.0
EXPOSE 8400 8500 8600/udp
