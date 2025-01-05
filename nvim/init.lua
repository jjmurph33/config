vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd.colorscheme("murphy")

require("options")
require("keymaps")
require("misc")
require("terminal")
require("floatterminal")
require("menu")
require("plugins.lazy")
