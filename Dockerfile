FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y && apt-get install wget gnupg certbot -y

RUN sh -c "echo deb-src http://download.opensuse.org/repositories/multimedia:/xiph/Debian_9.0/ ./ >>/etc/apt/sources.list.d/icecast.list"

RUN wget http://icecast.org/multimedia-obs.key && \
    gpg multimedia-obs.key && \
    apt-key add multimedia-obs.key

RUN apt-get update && apt-get install icecast2 -y

RUN cat /etc/default/icecast2 && \
    apt autoremove && apt clean && \
    rm -rf /var/lib/apt/lists/*

CMD /etc/init.d/icecast2 start && tail -F /var/log/icecast2/error.log