vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd.colorscheme("murphy")

require("options")
require("keymaps")
require("misc")
require("plugins.lazy")
