FROM ubuntu
CMD /bin/bash
MAINTAINER Stuart Cunliffe,UK s_cunliffe@uk.ibm.com
RUN apt-get update
RUN apt-get install -y wget
CMD sleep 60000
