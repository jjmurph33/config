### My personal configuration files and notes

#### Update the system
sudo apt update ; sudo apt upgrade

#### Install all the things
sudo apt install ssh git vim build-essential man python3 python-is-python3 python3-pip python3-venv python3-ipython direnv fzf curl wget bat xsel htop zip libsdl2-2.0-0 libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev pkg-config libusb-1.0-0-dev libftdi1-dev libudev-dev ripgrep luarocks golang ninja-build gettext cmake sqlite3 fish libjpeg-dev xclip ghostwriter libclang-dev ruby python3-neovim tree clangd zathura

#### generate ssh keys
ssh-keygen -t ed25519

#### rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#### uv for python
pip install uv --break-system-packages

#### fnm for node and npm
curl -o- https://fnm.vercel.app/install | bash
fnm install 24

#### zed
curl -f https://zed.dev/install.sh | sh

#### usagi
curl -fsSL https://usagiengine.com/install.sh | sh

#### neovim
wget https://github.com/neovim/neovim/releases/download/v0.12.4/nvim-linux-x86_64.tar.gz
tar xf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim

#### treesitter
cargo install tree-sitter-cli

#### create symlinks to the config files in this repo
sh symlinks.sh

#### fish shell
fish_update_completions  
chsh -s /usr/bin/fish  


