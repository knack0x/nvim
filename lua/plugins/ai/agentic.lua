vim.pack.add({ "https://github.com/carlos-algms/agentic.nvim" })

require("agentic").setup({
	provider = "opencode-acp",
})

-- Custom command: :VisionAnalyze <image_path> [prompt]
vim.api.nvim_create_user_command("VisionAnalyze", function(args)
	local img_path = args.args and args.args:gsub("^%s+", "") or ""
	if img_path == "" then
		vim.notify("Usage: :VisionAnalyze <image_path> [prompt]", vim.log.levels.ERROR)
		return
	end
	
	if not vim.loop.fs_stat(img_path) then
		vim.notify("File not found: " .. img_path, vim.log.levels.ERROR)
		return
	end
	
	local skill_script = os.getenv("HOME") .. "/.config/opencode/skills/vision-analyze/analyze.sh"
	local prompt = args.bang and ' "' .. args.args:gsub(img_path, ""):gsub("^%s+", '') .. '"' or ''
	
	vim.notify("Analyzing image with Qwen Vision...", vim.log.levels.INFO)
	
	vim.fn.jobstart({
		"bash", "-c",
		string.format('%s %q%s', skill_script, img_path, prompt),
	}, {
		on_stdout = function(_, data)
			if data and #data > 0 then
				local output = table.concat(data, "\n")
				vim.notify("✅ Vision Analysis:\n" .. output:gsub("\n", " "), vim.log.levels.INFO)
				vim.fn.setreg("+", output) -- Copy to clipboard too
			end
		end,
		on_stderr = function(_, data)
			if data and #data > 0 then
				vim.notify("Vision Error: " .. table.concat(data, "\n"), vim.log.levels.ERROR)
			end
		end,
	})
end, {
	nargs = "*",
	desc = "Analyze image with Qwen Vision via LM Studio",
	completion = function(arg_lead, cmdline, _)
		if cmdline:match("^.*%s+$") then
			return vim.fn.globpath(".", arg_lead .. "*")
		end
	end,
})
