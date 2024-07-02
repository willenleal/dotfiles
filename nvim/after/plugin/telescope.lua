--[[ local telescope = require("telescope"); ]]

--[[ telescope.setup {
    extensions = {
        file_browser = {
            hijack_netrw = true,
        },
    },
} ]]

-- require("telescope").load_extension "file_browser"

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

--[[ vim.keymap.set("n", "<leader>pv", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end) ]]
