return {
    {
        'stevearc/oil.nvim',
        version = "2.10.0",
        config = function()
            require('oil').setup({
                default_file_explorer = true
            })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = false,
            no_italic = true,
            styles = { comments = {}, conditionals = {} }
        },
        config = function() vim.cmd.colorscheme "catppuccin-mocha" end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = false,
                    lsp_doc_border = true,
                },
            })
        end
    },
    { "rust-lang/rust.vim", config = function() vim.g.rustfmt_autosave = 1 end },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"
        }
    }, { 'nvim-tree/nvim-web-devicons' },
    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }, {
        'windwp/nvim-autopairs',
        opts = { disable_filetype = { "TelescopePrompt", "vim" } }
    }
}
