wget https://github.com/neovim/neovim/releases/download/v0.12.4/nvim-linux-x86_64.tar.gz
tar xf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
rm nvim-linux-x86_64.tar.gz

# LSPs
sudo mkdir /opt/lsp
# lua
wget https://github.com/LuaLS/lua-language-server/releases/download/3.19.0/lua-language-server-3.19.0-linux-x64.tar.gz
mkdir luals
tar xf lua-language-server-3.19.0-linux-x64.tar.gz -C luals
sudo mv luals /opt/lsp/luals
rm lua-language-server-3.19.0-linux-x64.tar.gz
# python
sudo apt install python3-pylsp
# rust
rustup component add rust-analyzer


