FROM manjarolinux/base

COPY ./rootfs/ /

RUN pacman -Syu --no-confirm
