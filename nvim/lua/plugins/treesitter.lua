return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = { enable = true },
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"css",
				"json",
				"yaml",
				"php",
				"html",
				"toml",
				"go",
				"rust",
				"c",
				"sql",
				"python",
				"regex",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
