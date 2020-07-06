FROM ubuntu
CMD /bin/bash
MAINTAINER Stuart Cunliffe,UK s_cunliffe@uk.ibm.com
ENV http_proxy http://9.196.156.29:3128
ENV https_proxy https://9.196.156.29:3128
COPY liblwp-protocol-https-perl_6.04-2_all.deb /tmp
RUN apt-get update
RUN apt-get install -y wget
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install apache2 perl rrdtool ed bc -y
RUN apt-get install librrdp-perl libxml-sax-perl libxml-simple-perl libtimedate-perl libenv-sanctify-perl libcgi-pm-perl libdata-dumper-simple-perl libpdf-api2-perl libxml2-utils -y
RUN apt-get install /tmp/liblwp-protocol-https-perl_6.04-2_all.deb -y --allow-downgrades
RUN apt-get install libcrypt-ssleay-perl libio-socket-ssl-perl libmozilla-ldap-perl libxml-parser-perl -y
RUN apt-mark hold liblwp-protocol-https-perl
#RUN apt-get install httpd -y
CMD sleep 60000
