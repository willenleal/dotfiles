-- Utilities for creating configurations
local util = require "formatter.util"

require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
            require("formatter.filetypes.typescriptreact").eslint_d
        },
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}

vim.api.nvim_create_autocmd("BufWritePost", {
    command = 'FormatWriteLock'
})
