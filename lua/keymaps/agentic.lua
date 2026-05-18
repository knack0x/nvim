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

-- Vision Analyze via LM Studio (bypasses ACP)
vim.keymap.set('n', '<leader>av', function()
	local img_path = vim.fn.input("Image path: ")
	if img_path == "" then return end
	
	-- Check if file exists
	if not vim.loop.fs_stat(img_path) then
		vim.notify("File not found: " .. img_path, vim.log.levels.ERROR)
		return
	end
	
	local skill_script = os.getenv("HOME") .. "/.config/opencode/skills/vision-analyze/analyze.sh"
	
	vim.fn.jobstart({
		"bash", "-c",
		string.format('%s %q "Beschreibe das Bild kurz und gib Details zu Stil, Farben und Inhalt an."', skill_script, img_path),
	}, {
		on_stdout = function(_, data)
			if data and #data > 0 then
				local output = table.concat(data, "\n")
				vim.notify("Vision Analysis:\n" .. output:gsub("\n", " "), vim.log.levels.INFO)
				
				-- Also copy to clipboard for easy paste into agentic chat
				vim.fn.setreg("+", output)
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 0 then
				vim.notify("Vision Error: " .. table.concat(data, "\n"), vim.log.levels.ERROR)
			end
		end,
	})
end, { desc = "Analyze image with Qwen Vision" })

-- Quick vision paste (copies analysis to clipboard for agentic chat)
vim.keymap.set('n', '<leader>avp', function()
	local img_path = vim.fn.input("Image path: ")
	if img_path == "" then return end
	
	if not vim.loop.fs_stat(img_path) then
		vim.notify("File not found: " .. img_path, vim.log.levels.ERROR)
		return
	end
	
	local skill_script = os.getenv("HOME") .. "/.config/opencode/skills/vision-analyze/analyze.sh"
	
	vim.fn.jobstart({
		"bash", "-c",
		string.format('%s %q', skill_script, img_path),
	}, {
		on_stdout = function(_, data)
			if data and #data > 0 then
				local output = table.concat(data, "\n")
				vim.fn.setreg("+", output)
				vim.notify("✅ Vision analysis copied to clipboard. Paste it into agentic chat with <C-'>.", vim.log.levels.INFO)
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 0 then
				vim.notify("Vision Error: " .. table.concat(data, "\n"), vim.log.levels.ERROR)
			end
		end,
	})
end, { desc = "Analyze image & copy to clipboard" })
