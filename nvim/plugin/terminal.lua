local term_job_id = -1
local term_window = -1
local term_command = ""

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.keymap.set("n", "<leader>to", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.api.nvim_win_set_width(0, 50)
	term_window = vim.api.nvim_get_current_win()
	term_job_id = vim.bo.channel
	vim.cmd("normal A")
end, { desc = "terminal [o]pen" })

vim.keymap.set("n", "<leader>tc", function()
	if vim.api.nvim_win_is_valid(term_window) then
		vim.api.nvim_win_close(term_window, false)
	end
end, { desc = "terminal [c]lose" })

vim.keymap.set("n", "<leader>tr", function()
	term_command = vim.fn.input("Command: ", term_command)
	vim.fn.chansend(term_job_id, { term_command, "" })
	local buf = vim.api.nvim_win_get_buf(term_window)
	vim.api.nvim_win_set_cursor(term_window, { vim.api.nvim_buf_line_count(buf), 0 })
end, { desc = "terminal [r]un" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

return {}
