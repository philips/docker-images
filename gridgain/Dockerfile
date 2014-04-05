FROM dockerfile/java
MAINTAINER Fawad Halim <fawad@fawad.net>

RUN cd /tmp
RUN wget -O gridgain.zip http://www.gridgain.org/media/gridgain-platform-os-6.0.2-nix.zip
RUN unzip gridgain.zip
RUN rm gridgain.zip
RUN mv gridgain* /opt/gridgain

ENV GRIDGAIN_HOME /opt/gridgain/distro

CMD ${GRIDGAIN_HOME}/bin/ggstart.sh -v

EXPOSE 8080 11211 47100 47500 49112 48100
