FROM jsii/superchain:latest

LABEL MAINTAINER="Daniel Schroeder <deemes79@googlemail.com>"

ADD scripts /scripts

ENTRYPOINT [ "bash", "/scripts/entrypoint" ]
