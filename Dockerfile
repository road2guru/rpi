FROM ubuntu:16.04

RUN  apt-get update && apt-get install -y sudo vim locales build-essential gawk wget git-core diffstat unzip texinfo bc cpio python libncurses-dev \
     chrpath socat && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
RUN  useradd -m user && usermod -a -G sudo user && echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

VOLUME /work
USER user

CMD [ "/bin/bash" ]


