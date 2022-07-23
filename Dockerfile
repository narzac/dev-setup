FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y sudo software-properties-common curl git build-essential && \
  apt-add-repository -y ppa:ansible/ansible && \
  apt-get update && \
  apt-get install -y ansible && \
  apt-get clean autoclean && \
  apt-get autoremove --yes

FROM base AS naruto
RUN addgroup --gid 1000 naruto
RUN adduser --gecos naruto --uid 1000 --gid 1000 --disabled-password naruto
RUN usermod -aG sudo naruto
# Ensure sudo group users are not 
# asked for a password when using 
# sudo command by ammending sudoers file
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER naruto
WORKDIR /home/naruto

FROM naruto
COPY . .
CMD ["sh", "-c", "ansible-playbook ubuntu-playbook.yml"]
