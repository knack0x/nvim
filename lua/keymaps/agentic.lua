-- Toggle Agentic Chat
vim.keymap.set({ "n", "v", "i" }, "<C-\\>", function()
	require("agentic").toggle()
end, { desc = "Toggle Agentic Chat" })

-- Add file or selection to Context
vim.keymap.set({ "n", "v" }, "<C-'>", function()
	require("agentic").add_selection_or_file_to_context()
end, { desc = "Add to Agentic Context" })

-- New Session
vim.keymap.set({ "n" }, "<space>an", function()
	require("agentic").new_session()
end, { desc = "New Agentic Session" })

-- Restore Session
vim.keymap.set({ "n" }, "<space>ar", function()
	require("agentic").restore_session()
end, { desc = "Agentic Restore session", silent = true })

-- Line Diagnostics
vim.keymap.set("n", "<leader>ad", function()
	require("agentic").add_current_line_diagnostics()
end, { desc = "Add line diagnostic to Agentic" })

-- Buffer Diagnostics
vim.keymap.set("n", "<leader>aD", function()
	require("agentic").add_buffer_diagnostics()
end, { desc = "Add all buffer diagnostics to Agentic" })

-- Stop Generation
vim.keymap.set("n", "<leader>as", function()
	require("agentic").stop_generation()
end, { desc = "Stop current Agentic generation" })


-- Shift-Tab auf <leader>af binden
vim.keymap.set({ 'n', 'v' }, '<leader>af', '<S-Tab>',
	{ desc = 'Agentic shift+tab zu <leader>af wechseln', remap = true })
