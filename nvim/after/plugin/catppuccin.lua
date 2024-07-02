require("catppuccin").setup({
    transparent_background = false, -- disables setting the background color.
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    no_italic = true, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = {}, -- Change the style of comments
        conditionals = {},
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin-mocha"
