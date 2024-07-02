return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {{'nvim-lua/plenary.nvim'}},
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', function()
            builtin.find_files({no_ignore = false, hidden = true})
        end, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.live_grep({additional_args = {"--hidden"}})
        end, {})
    end
}

