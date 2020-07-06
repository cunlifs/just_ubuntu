FROM ubuntu
CMD /bin/bash
MAINTAINER Stuart Cunliffe,UK s_cunliffe@uk.ibm.com
ENV http_proxy http://9.196.156.29:3128
ENV https_proxy https://9.196.156.29:3128
RUN apt-get update
RUN apt-get install -y wget vi
RUN apt-get install apache2 perl rrdtool ed bc
RUN apt-get install librrdp-perl libxml-sax-perl libxml-simple-perl libtimedate-perl libenv-sanctify-perl libcgi-pm-perl libdata-dumper-simple-perl libpdf-api2-perl libxml2-utils
RUN apt-get install liblwp-protocol-https-perl=6.04-2 libcrypt-ssleay-perl libio-socket-ssl-perl libmozilla-ldap-perl libxml-parser-perl
CMD sleep 60000
