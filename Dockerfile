# KBE_SERVER
#
# VERSION              0.0.1

FROM ubuntu

MAINTAINER slw

RUN apt update
RUN apt install -y lsb-release
RUN apt install -y gcc
RUN apt install -y libmysqlclient20
RUN apt install -y telnet
VOLUME ["/kbe/kbengine/" , "/kbe/source/"]

EXPOSE 20013 20015 20016 20017 40000

WORKDIR /kbe/source/assets/
# CMD ["sh" ,"/kbe/source/assets/start_server.sh"]