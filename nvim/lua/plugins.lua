return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = false,
            no_italic = true,
            styles = {comments = {}, conditionals = {}}
        },
        config = function() vim.cmd.colorscheme "catppuccin-mocha" end
    },
    {"rust-lang/rust.vim", config = function() vim.g.rustfmt_autosave = 1 end},
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"
        }
    }, {'nvim-tree/nvim-web-devicons'},
    {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }, {
        'windwp/nvim-autopairs',
        opts = {disable_filetype = {"TelescopePrompt", "vim"}}
    }
}
