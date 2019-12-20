FROM python:3.7.5-slim-buster

LABEL MAINTAINER="Daniel Schroeder <deemes79@googlemail.com>"

# Install nodejs, dotnet, mvn, twine etc
RUN apt-get update && \
    apt-get install -y apt-transport-https gpg curl software-properties-common && \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
    curl https://packages.microsoft.com/config/debian/10/prod.list -o /etc/apt/sources.list.d/microsoft-prod.list && \
    curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
    mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get install -y dotnet-sdk-3.1 maven nodejs && \
    pip3 install twine==3.1.1 && \
    apt-get clean

ADD entrypoint /

ENTRYPOINT [ "bash", "/entrypoint" ]
