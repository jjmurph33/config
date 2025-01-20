-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- easily exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- quickfix list
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- C-s to save
vim.keymap.set({ "i", "n" }, "<C-s>", "<Cmd>w<CR><Esc>")

-- Send all delete operations to the "black hole register"
vim.keymap.set({'n', 'v'}, 'd', '"_d')
vim.keymap.set({'n', 'v'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, 'c', '"_c')
vim.keymap.set({'n', 'v'}, 'C', '"_C')

-- F10 to toggle diagnostic messages from LSP
local diagnostic_visible = false
function ToggleDiagnostics()
	diagnostic_visible = not diagnostic_visible
	vim.diagnostic.config({
		virtual_text = diagnostic_visible,
		signs = diagnostic_visible,
		underline = diagnostic_visible,
	})
end
vim.diagnostic.config({
	virtual_text = diagnostic_visible,
	signs = diagnostic_visible,
	underline = diagnostic_visible,
})
vim.keymap.set("n", "<F10>", ToggleDiagnostics, { desc = "Toggle Diagnostics" })

-- run lua code
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

-- Shift-Tab to switch to last buffer
vim.keymap.set("n", "<S-Tab>", ":b#<CR>", { noremap = true, silent = true })
