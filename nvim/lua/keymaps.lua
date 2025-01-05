-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- C-s to save
vim.keymap.set({ "i", "n" }, "<C-s>", "<Cmd>w<CR><Esc>")

vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

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
