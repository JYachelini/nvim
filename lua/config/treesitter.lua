require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "lua", "json", "html", "css", "bash", "terraform" }, -- Add languages you need
	highlight = {
		enable = true,
	},
	indent = {
		enable = true, -- This enables better indentation support for some languages
	},
	autopairs = {
		enable = true, -- Enables autopairs integration with treesitter
	},
})
