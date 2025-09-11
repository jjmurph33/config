### My personal configuration files and notes

#### Update the system
sudo apt update ; sudo apt upgrade

#### Install all the things
sudo apt install ssh git vim build-essential man python3 python-is-python3 python3-pip python3-venv python3-ipython direnv fzf curl wget bat xsel htop zip libsdl2-2.0-0 libsdl2-dev pkg-config libusb-1.0-0-dev libftdi1-dev libudev-dev ripgrep luarocks golang ninja-build gettext cmake sqlite3 fish libjpeg-dev

#### generate ssh keys
sudo apt install ssh git vim build-essential man python3 python-is-python3 python3-pip python3-venv python3-ipython direnv fzf curl wget bat xsel htop zip libsdl2-2.0-0 libsdl2- dev pkg-config libusb-1.0-0-dev libftdi1-dev libudev-dev ripgrep luarocks golang ninja-build gettext cmake sqlite3 fish libjpeg-dev

#### rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#### uv for python
pip install uv --break-system-packages

#### other programs
extract and move from ~/config/programs to home

#### create symlinks to the config files in this repo
`ln -s ~/config/fonts ~/.fonts`  
`ln -s ~/config/vim/vimrc ~/.vimrc`  
`ln -s ~/config/git/gitconfig ~/.gitconfig`  
`ln -s ~/config/nvim ~/.config/`  
`ln -s ~/config/fish ~/.config/`  

#### fish shell
chsh -s /usr/bin/fish  
fish_update_completions

