local term_window = -1 -- bottom window
local run_term_window = -1 -- right side window
local run_term_job_id = -1
local run_term_command = ""

-- options for all new terminals
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

-- open a terminal at the bottom of the screen
vim.keymap.set("n", "<leader>to", function()
	vim.cmd.new()
	vim.cmd.term()
	vim.api.nvim_win_set_height(0, 15)
	vim.cmd("normal A")
	term_window = vim.api.nvim_get_current_win()
end, { desc = "terminal [o]pen" })

-- close the bottom terminal
vim.keymap.set("n", "<leader>tc", function()
	if vim.api.nvim_win_is_valid(term_window) then
		vim.api.nvim_win_close(term_window, false)
	end
end, { desc = "terminal [c]lose" })

-- F12 to run command in right side terminal
vim.keymap.set("n", "<F12>", function()
	if not vim.api.nvim_win_is_valid(run_term_window) then
		vim.cmd.vnew()
		vim.cmd.term()
		vim.api.nvim_win_set_width(0, 50)
		run_term_window = vim.api.nvim_get_current_win()
		run_term_job_id = vim.bo.channel
		vim.cmd("wincmd h")
	end
	if run_term_command == "" then
		vim.ui.input({ prompt = "Command: " }, function(input)
			run_term_command = input
		end)
	end
	vim.fn.chansend(run_term_job_id, { "clear", "" })
	vim.fn.chansend(run_term_job_id, { run_term_command, "" })
end, { desc = "Run last command" })

-- update the command for the right side terminal
vim.keymap.set("n", "<leader>tr", function()
	vim.ui.input({ prompt = "Command: " }, function(input)
		run_term_command = input
	end)
	vim.fn.chansend(run_term_job_id, { run_term_command, "" })
end, { desc = "terminal [r]un (F12 to rerun)" })

vim.keymap.set("n", "<F2>", function()
	print("hi")
end, { desc = "" })

return {}
