FROM ubuntu
CMD /bin/bash
MAINTAINER Stuart Cunliffe,UK s_cunliffe@uk.ibm.com
ENV http_proxy http://9.196.156.29:3128
ENV https_proxy https://9.196.156.29:3128
RUN yum update 
RUN apt-get update
RUN apt-get install -y wget
CMD sleep 60000
