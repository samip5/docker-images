# Manjaro 64-bit arm base image
FROM manjaroarm/manjaro-aarch64-base

WORKDIR /usr/local/src/

# Install devel requirements plus git
RUN pacman -Syu --noconfirm base-devel git sudo go

# Clear pacman cache.
RUN pacman -Scc --noconfirm

RUN useradd -G wheel -m user

RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN chown -R user:wheel /usr/local/src/

USER user

RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay && makepkg -si --noconfirm
