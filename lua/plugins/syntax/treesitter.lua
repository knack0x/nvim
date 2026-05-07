vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main"
	},
})

require("nvim-treesitter").setup({
	ensure_installed = {
		"typescript",
		"html",
		"css",
		"javascript",
		"svelte",
		"go",
		"gomod",
		"templ",
		"php",
		"markdown",
		"markdown_inline",
		"lua",
		"bash",
		"python",
		"json",
		"yaml",
		"toml",
		"vim",
		"vimdoc",
		"diff",
		"c",
	},
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "v",
			node_incremental = "v",
			node_decremental = "V",
		},
	},
})

vim.treesitter.language.register("markdown", "md")
vim.treesitter.language.register("bash", "sh")
vim.treesitter.language.register("javascript", "js")
vim.treesitter.language.register("typescript", "ts")
vim.treesitter.language.register("python", "py")
vim.treesitter.language.register("yaml", "yml")

vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
