FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
    apt install software-properties-common -y && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/cache/apt/lists /var/cache/apt/archives /var/lib/apt/lists

RUN add-apt-repository ppa:ondrej/nginx-mainline

RUN apt update -y && \
    apt install nginx-extras -y && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/cache/apt/lists /var/cache/apt/archives /var/lib/apt/lists

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
