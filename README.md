### My personal configuration files and notes

#### Update the system
sudo apt update ; sudo apt upgrade

#### Install all the things
sudo apt install ssh git vim build-essential man python3 python-is-python3 python3-pip python3-venv python3-ipython direnv fzf curl wget bat xsel htop zip libsdl2-2.0-0 libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev pkg-config libusb-1.0-0-dev libftdi1-dev libudev-dev ripgrep luarocks golang ninja-build gettext cmake sqlite3 fish libjpeg-dev xclip ghostwriter

#### generate ssh keys
ssh-keygen -t ed25519

#### rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#### uv for python
pip install uv --break-system-packages

#### zed
curl -f https://zed.dev/install.sh | sh

#### other programs
extract and move from ~/config/programs to /opt/

#### create symlinks to the config files in this repo
`ln -s ~/config/fonts ~/.fonts`  
`ln -s ~/config/vim/vimrc ~/.vimrc`  
`ln -s ~/config/git/gitconfig ~/.gitconfig`  
`ln -s ~/config/nvim ~/.config/`  
`ln -s ~/config/zed/settings.json ~/.config/zed/settings.json`
`rm -r ~/.config/fish ; ln -s ~/config/fish ~/.config/`  

#### fish shell
fish_update_completions
chsh -s /usr/bin/fish  


