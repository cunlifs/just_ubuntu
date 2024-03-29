# - PPC64LE FROM ubuntu@sha256:5abe5c5414cae21985d2cc4795650a092d72b96a379ae2c618dc9de73835dc8c
# Below is ARM image
FROM ubuntu@sha256:c0dd38485ed8b6e149d2fc935d1c61a3b750cda3b3eace0ad6df4abe33fa2b90
CMD /bin/bash
MAINTAINER Stuart Cunliffe,UK s_cunliffe@uk.ibm.com
ENV http_proxy http://9.196.156.29:3128
ENV https_proxy https://9.196.156.29:3128
COPY liblwp-protocol-https-perl_6.04-2_all.deb /tmp
COPY apache2_conf /tmp
#COPY httpd_conf /tmp
RUN apt-get update
RUN apt-get install -y wget
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install apache2 perl rrdtool ed bc -y
RUN apt-get install librrdp-perl libxml-sax-perl libxml-simple-perl libtimedate-perl libenv-sanctify-perl libcgi-pm-perl libdata-dumper-simple-perl libpdf-api2-perl libxml2-utils -y
RUN apt-get install /tmp/liblwp-protocol-https-perl_6.04-2_all.deb -y --allow-downgrades
RUN apt-get install libcrypt-ssleay-perl libio-socket-ssl-perl libmozilla-ldap-perl libxml-parser-perl -y
RUN apt-mark hold liblwp-protocol-https-perl
#RUN apt-get install httpd -y
#RUN service apache2 restart
RUN a2enmod cgi 
RUN cat /tmp/apache2_conf >> /etc/apache2/apache2.conf
RUN service apache2 restart
EXPOSE 8080
CMD sleep 60000
