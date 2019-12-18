FROM python:3.7.5-slim-buster

LABEL MAINTAINER="Daniel Schroeder <deemes79@googlemail.com>"

# Install nodejs, dotnet, mvn, twine etc
RUN apt-get update && \
    apt-get install -y apt-transport-https wget gpg curl software-properties-common && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
    mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ && \
    wget -q https://packages.microsoft.com/config/debian/10/prod.list && \
    mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
    apt-get update && \
    apt-get install -y dotnet-sdk-3.1 && \
    curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
    apt install -y nodejs && \
    mkdir -p /usr/share/man/man1 && \
    apt-get install -y maven && \
    pip3 install twine==3.1.1 && \
    apt-get clean

ADD entrypoint /

WORKDIR /workdir

ENTRYPOINT [ "bash", "/entrypoint" ]
