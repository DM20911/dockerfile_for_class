FROM debian:latest AS base
    LABEL author="RedTeam"
    LABEL description="Docker image RedTeam"
    ENV WORKDIR_ENV=/RedTeam
    WORKDIR ${WORKDIR_ENV}
    SHELL ["/bin/bash", "-c"]

    RUN apt-get update && apt-get -y install net-tools python3 python3-dev python3-pip \
        netcat wget exiftool curl git gcc nmap unzip firefox-esr autoconf automake xfce4-terminal \
        apt-utils openssh-server openssl build-essential libc-dev libsqlite3-0 libsqlite3-dev \
        libpq-dev libpcap-dev zlib1g-dev zlib1g libssl-dev libevent-dev libxslt-dev gem libnet-ssleay-perl 

    RUN cd ${WORKDIR_ENV} && git clone https://github.com/lanmaster53/recon-ng.git
    RUN cd ${WORKDIR_ENV} && git clone https://github.com/s0md3v/Photon.git
    RUN cd ${WORKDIR_ENV} && git clone https://github.com/Mr-Un1k0d3r/MaliciousMacroGenerator.git
    RUN cd ${WORKDIR_ENV} && git clone https://github.com/wpscanteam/wpscan.git
    RUN cd ${WORKDIR_ENV} && git clone https://github.com/m0rtem/CloudFail.git
    RUN cd ${WORKDIR_ENV} && git clone https://github.com/Ha3MrX/DDos-Attack.git
    RUN cd ${WORKDIR_ENV} && git clone https://github.com/laramies/theHarvester.git
    RUN cd ${WORKDIR_ENV} && git clone https://github.com/sullo/nikto

    RUN cd ${WORKDIR_ENV} && wget https://dist.torproject.org/tor-0.4.5.8.tar.gz && \
        tar -xvf tor-0.4.5.8.tar.gz && \
        rm -rf tor-0.4.5.8.tar.gz && \
        mv tor-0.4.5.8 tor-latest

    RUN cd ${WORKDIR_ENV} && wget http://morningstarsecurity.com/downloads/urlcrazy-0.5.tar.gz && \
        tar -xvf urlcrazy-0.5.tar.gz && \
        rm -rf urlcrazy-0.5.tar.gz && \
        mv urlcrazy-0.5 urlcrazy

    RUN cd ${WORKDIR_ENV} && git clone https://github.com/rthalley/dnspython && \
        cd dnspython/ && \
        python3 setup.py install
