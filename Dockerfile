FROM alpine:latest
#MAINTAINER Maël Auzias <docker@mael.auzias.net>


# python3
RUN adduser -S python
RUN apk --no-cache add python3

# pip3
RUN apk --no-cache add curl \
    ca-certificates \
    && curl -O https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

RUN ls -lha /usr/lib/
RUN pip install zerobin \
    && chown python:root -R /usr/lib/python*/site-packages/zerobin/

USER python

ENTRYPOINT [ "zerobin", "--host=0.0.0.0" ]
