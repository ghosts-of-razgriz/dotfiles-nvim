FROM archlinux:latest

RUN pacman -Sy --noconfirm \
      base-devel nodejs python3 python-pip ruby sudo git && \
      useradd neovim-dev -m -g wheel yarn && \
      echo 'neovim-dev ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/neovim-dev

WORKDIR /home/neovim-dev

USER neovim-dev

RUN git clone https://aur.archlinux.org/pikaur.git  &&\
      cd pikaur &&\
      makepkg -fsri --noconfirm &&\
      cd &&\
      rm -rf pikaur &&\
      pikaur -S --noconfirm neovim-nightly-git &&\
      echo "alias pip3=pip" > /home/neovim-dev/.bashrc

