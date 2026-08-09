vim.cmd.colorscheme("catppuccin")

vim.g.mapleader = " "

vim.o.number = true
vim.o.relativenumber = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.signcolumn = "yes"
vim.o.autoread = true
--vim.o.laststatus = 3
--vim.o.cmdheight = 0
vim.o.clipboard = "unnamedplus" -- sync yank/put with OS clipboard
vim.o.breakindent = true
vim.o.undofile = true -- save undo history
vim.o.ignorecase = true
vim.o.smartcase = true
-- whitespace characters
--vim.o.list = true
--vim.o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.autochdir = true  -- auto change directory to current buffer
vim.o.hidden = true -- can change buffers without saving


-- keymaps -----------------------------------------------------------

-- file panel
vim.keymap.set("n","<leader>e",":Lexplore<cr>")
-- fuzzy finder
vim.keymap.set("n","<leader>f",":find ")
-- diagnostics in the quickfix window
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.setqflist()
	vim.cmd("copen")
end)
-- grep results in the quickfix window
vim.keymap.set("n", "<leader>g", function()
	vim.ui.input({ prompt = "grep: " }, function(pattern)
		if pattern then
			vim.cmd("silent grep! " .. vim.fn.fnameescape(pattern))
			vim.cmd("copen")
		end
	end)
end)
-- toggle quickfix window
vim.keymap.set("n","<leader>q",function()
if vim.fn.getqflist({winid=1}).winid == 0 then
    vim.cmd("copen")
else
    vim.cmd("cclose")
end
end)
-- C-s to save
vim.keymap.set({ "i", "n" }, "<C-s>",	"<Cmd>w<CR><Esc>")
-- Shift-Tab to switch to last buffer
vim.keymap.set("n", "<S-Tab>", ":b#<CR>")
-- Send delete operations to the "black hole register"
vim.keymap.set({'n', 'v'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, 'd', '"_d')
vim.keymap.set({'n', 'v'}, 'c', '"_c')
vim.keymap.set({'n', 'v'}, 'C', '"_C')
-- move lines
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
-- switch / close windows
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-q>", ":wincmd q<CR>")
vim.keymap.set({"i","t"}, "<C-h>", "<Esc>:wincmd h<CR>")
vim.keymap.set({"i","t"}, "<C-j>", "<Esc>:wincmd j<CR>")
vim.keymap.set({"i","t"}, "<C-k>", "<Esc>:wincmd k<CR>")
vim.keymap.set({"i","t"}, "<C-l>", "<Esc>:wincmd l<CR>")
vim.keymap.set({"i","t"}, "<C-q>", "<Esc>:wincmd q<CR>")
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- easily exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

--------------------------------------------------------------------------------------

-- LSPs
vim.lsp.enable({"lua_ls","pylsp","rust_analyzer","clangd"});

-- Treesitter Parsers
require("nvim-treesitter").install({
  "rust",
  "python",
  "json",
  "toml",
  "html",
  "javascript",
})

-- diagnostics
vim.diagnostic.config({virtual_text={
	current_line=true,
	virt_text_pos="right_align",
}})

-- auto completion
vim.api.nvim_create_autocmd("LspAttach",{
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true,client.id,ev.buf,{autotrigger=true})
		end
	end,
})
vim.cmd("set completeopt+=noselect") -- don't automatically select the 1st option

-- file explorer
vim.g.netrw_liststyle = 3 -- tree view
vim.g.netrw_banner = 0 -- hide the top banner
vim.g.netrw_winsize = 15 -- left split width
vim.g.netrw_browse_split = 0 -- open files in the previous window
vim.g.netrw_altfile = 1 -- keep the alternate file correct

-- grep (cargo install ripgrep)
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"

-- find ---------------------------------------------------------------------
local ignore_patterns = {
	"node_modules",
	"%.git",
	"%.cache",
	"dist",
	"build",
	"%.tmp",
	"%.log",
}

function _G.native_find(text, _)
	local files = vim.fn.glob("**/*", true, true)
	local result = {}
	for _, f in ipairs(files) do
		if vim.fn.isdirectory(f) == 0 then
			local skip = false
			for _, pat in ipairs(ignore_patterns) do
				if f:match(pat) then
					skip = true
					break
				end
			end
			if not skip then
				result[#result + 1] = f
			end
		end
	end
	return vim.fn.matchfuzzy(result, text)
end
vim.opt.findfunc = "v:lua.native_find"

--------------------------------------------------------------------------------------


-- autocommands -----------------------------------------------------------------

-- Highlight selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

--------------------------------------------------------------------------------------


