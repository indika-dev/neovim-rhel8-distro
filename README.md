# neovim-rhel8-distro

Pack a neovim distro based on LazyVim for an offline RHEL8 Server/RHEL8 Server without internet connection

Ensure the following software prerequisites are fulfilled:

- on the local machine: podman
- on the remote machine: an appropriate node version(the node version provided by RHEL8 will not work!)

Ensure the following directories exist and are configured correctly:

- share-nvim -> initially empty and maps to $USER/.local/share/nvim
- config-nvim -> contains your neovim configuration and maps to $USER/.config/nvim
- dist -> contains an appimage for RHEL8 -> used for building the image, can be built by [neovim-distros](https://github.com/indika-dev/neovim-distros)

Building/Updating the distro

- execute ./buildAndUpdate
- after quitting neovim you will be asked, if a distro should be built
- if yes(j), then a file rhel8-distro.tar will be generated, containing config-nvim and share-nvim
- scp it to your server, unpack and move the directories accordingly
- start nvim on your server and voila
