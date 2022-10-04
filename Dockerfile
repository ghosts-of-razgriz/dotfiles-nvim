FROM archlinux:latest

RUN pacman -Sy --noconfirm \
      base-devel nodejs python3 python-pip ruby ripgrep sudo git go yarn && \
      useradd neovim-dev -m -g wheel && \
      echo 'neovim-dev ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/neovim-dev

WORKDIR /home/neovim-dev

USER neovim-dev

RUN git clone https://aur.archlinux.org/pikaur.git  &&\
      cd pikaur &&\
      makepkg -fsri --noconfirm &&\
      cd &&\
      rm -rf pikaur &&\
      pikaur -S --noconfirm neovim-nightly-git &&\
      gem install neovim &&\
      go get golang.org/x/tools/cmd/goimports &&\
      echo "alias pip3=pip" >> /home/neovim-dev/.bashrc &&\
      echo 'export PATH="/home/neovim-dev/go/bin:/home/neovim-dev/.config/yarn/global/node_modules/.bin:/home/neovim-dev/.gem/ruby/2.7.0/bin:$PATH"' >> /home/neovim-dev/.bashrc

