### My personal configuration files and notes

#### Update the system
sudo apt update ; sudo apt upgrade

#### Install all the things
sudo apt install git vim build-essential man python3 python-is-python3 python3-pip python3-venv python3-ipython direnv fzf curl wget bat xsel htop zip libsdl2-2.0-0 libsdl2-dev pkg-config libusb-1.0-0-dev libftdi1-dev libudev-dev ripgrep luarocks golang

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# yq tool
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O ~/.local/bin/yq && chmod +x ~/.local/bin/yq

# neovim
https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz

#### generate ssh keys (.ssh/id_dsa and .ssh/id_dsa.pub)
ssh-keygen -t ed25519

#### create symlinks to the config files in this repo
ln -s ~/config/vim/vimrc ~/.vimrc
ln -s ~/config/git/gitconfig ~/.gitconfig
ln -s ~/config/tmux/tmux.conf ~/.tmux.conf
ln -s ~/config/fish/config.fish ~/.config/fish/
ln -s ~/config/fish/fish_variables ~/.config/fish/
ln -s ~/config/fish/functions/ ~/.config/fish/
ln -s ~/config/nvim ~/.config/


