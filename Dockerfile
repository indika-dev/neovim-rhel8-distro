FROM redhat/ubi8

WORKDIR /root
RUN dnf -y update
RUN dnf -y install git nodejs gcc-c++ wget npm ninja-build cmake make fuse unzip python39 libtermcap-devel ncurses-devel libevent-devel lua
WORKDIR /dist
RUN cd lua-5.3.6 && make install
RUN ./nvim.appimage --appimage-extract
RUN cp -R ./squashfs-root/* /
WORKDIR /root
RUN wget https://luarocks.github.io/luarocks/releases/luarocks-3.11.1.tar.gz 
RUN tar xzf luarocks-3.11.1.tar.gz
RUN cd ./luarocks-3.11.1/ && ./configure && make install
RUN rm -rf luarocks-3.11.1
VOLUME [ "/root/.config/nvim" ]
VOLUME [ "/root/.local/share/nvim" ]
CMD [ "/usr/bin/nvim" ]

