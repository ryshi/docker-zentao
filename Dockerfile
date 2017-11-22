FROM ubuntu:17.10
MAINTAINER Ryan.Shi <shiymail@gmail.com>

RUN apt-get update && apt-get -y install wget

ENV HTTP_PORT 8080
ENV MYSQL_PORT 3690
ENV ZT_VER 9.6.2

WORKDIR /opt
RUN wget http://dl.cnezsoft.com/zentao/$ZT_VER/ZenTaoPMS.$ZT_VER.zbox_64.tar.gz && \
tar -zxvf ZenTaoPMS.$ZT_VER.zbox_64.tar.gz

# database port
EXPOSE $MYSQL_PORT
# http port
EXPOSE $HTTP_PORT

ENTRYPOINT /opt/zbox/zbox start -ap $HTTP_PORT && tail -f /dev/null

