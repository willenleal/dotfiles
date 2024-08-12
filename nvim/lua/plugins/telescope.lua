return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.4",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			pickers = {
				oldfiles = {
					cwd_only = true,
				},
			},
		})

		telescope.load_extension("noice")

		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({ no_ignore = false, hidden = true })
		end, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.live_grep({ additional_args = { "--hidden" } })
		end, {})
	end,
}
