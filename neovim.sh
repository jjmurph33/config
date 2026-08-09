wget https://github.com/neovim/neovim/releases/download/v0.12.4/nvim-linux-x86_64.tar.gz
tar xf nvim-linux-x86_64.tar.gz
sudo mv nvim-linux-x86_64 /opt/nvim
rm nvim-linux-x86_64.tar.gz

# LSPs
# lua
wget https://github.com/LuaLS/lua-language-server/releases/download/3.19.0/lua-language-server-3.19.0-linux-x64.tar.gz
tar xf lua-language-server-3.19.0-linux-x64.tar.gz
sudo mv lua-language-server-3.19.0-linux-x64 /opt/luals
rm lua-language-server-3.19.0-linux-x64.tar.gz
# python
pip install --break-system-packages python-lsp-server
# rust
rustup component add rust-analyzer

# Plugins
mkdir -p $HOME/.local/share/nvim/site/pack/plugins/start
# treesitter
cargo install tree-sitter-cli
cd $HOME/.local/share/nvim/site/pack/plugins/start
git clone git@github.com:nvim-treesitter/nvim-treesitter.git

