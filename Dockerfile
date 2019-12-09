FROM archlinux/base

RUN pacman -Syu --noconfirm base-devel sudo go git

RUN pacman -Scc --noconfirm

RUN useradd -G wheel -m user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN chown -R user:wheel /usr/local/src/

USER user

WORKDIR /usr/local/src/

RUN git clone https://aur.archlinux.org/yay.git
RUN cd yay && makepkg -si --noconfirm
