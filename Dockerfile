# Version 1.0.0
FROM ubuntu:latest
MAINTAINER vtor

RUN echo 'root:root' | chpasswd

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y aptitude sudo openssh-server python

ADD thoughtworks-hello-world /tmp/thoughtworks-hello-world
WORKDIR /tmp/thoughtworks-hello-world

RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22 8080
CMD ["/usr/sbin/sshd", "-D"]