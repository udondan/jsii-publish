FROM jsii/superchain:1-buster-slim

LABEL MAINTAINER="Daniel Schroeder <deemes79@googlemail.com>"

ADD scripts /scripts

ENTRYPOINT [ "bash", "/scripts/entrypoint" ]
