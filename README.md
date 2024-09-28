### My personal configuration files and notes

#### Update the system
sudo apt update ; sudo apt upgrade

#### Install all the things
sudo apt install git vim build-essential man python3 python-is-python3 python3-pip python3-venv python3-ipython zsh direnv fzf curl wget bat

#### generate ssh keys (.ssh/id_dsa and .ssh/id_dsa.pub)
ssh-keygen -t ed25519

#### create symlinks to the config files in this repo
ln -s config/zsh/zshrc ~/.zshrc
ln -s config/vim/vimrc ~/.vimrc
ln -s config/git/gitconfig ~/.gitconfig
ln -s config/tmux/tmux.conf ~/.tmux
