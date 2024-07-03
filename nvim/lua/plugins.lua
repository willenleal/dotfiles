return {
    {
        'stevearc/oil.nvim',
        version = "2.10.0",
        config = function()
            require('oil').setup({ default_file_explorer = true })
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    }, {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = false,
            no_italic = true,
            styles = { comments = {}, conditionals = {} }
        },
        config = function() vim.cmd.colorscheme "catppuccin-mocha" end
    }, {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true
                    }
                },
                presets = { bottom_search = false, lsp_doc_border = true }
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
    }, {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                typescriptreact = { "eslint_d" },
                python = { "ruff" },
                mypy = { "mypy" },
                kotlin = { "ktlint" },
                ruby = { "standardrb" },
                html = { "htmlhint" },
                json = { "jsonlint" },
                yaml = { "yamllint" }
            }

            local lint_augroup = vim.api.nvim_create_augroup("lint",
                { clear = true })

            vim.api.nvim_create_autocmd({
                "BufEnter", "BufWritePost", "InsertLeave"
            }, { group = lint_augroup, callback = function()
                lint.try_lint()
            end })

            vim.keymap.set("n", "<leader>ll", function()
                lint.try_lint()
            end)
        end
    }, {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    javascript = { { "prettierd", "prettier" } },
                    typescript = { { "prettierd", "prettier" } },
                    javascriptreact = { { "prettierd", "prettier" } },
                    typescriptreact = { { "prettierd", "prettier" } },
                    json = { { "prettierd", "prettier" } },
                    graphql = { { "prettierd", "prettier" } },
                    kotlin = { "ktlint" },
                    ruby = { "standardrb" },
                    markdown = { { "prettierd", "prettier" } },
                    html = { "htmlbeautifier" },
                    bash = { "beautysh" },
                    rust = { "rustfmt" },
                    yaml = { "yamlfix" },
                    toml = { "taplo" },
                    css = { { "prettierd", "prettier" } },
                    scss = { { "prettierd", "prettier" } },
                    sh = { { "shellcheck" } }
                },
                format_on_save = { timeout_ms = 500, lsp_format = "fallback" }
            })

            vim.keymap.set({ "n", "v" }, "<leader>f", function()
                conform.format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 1000
                })
            end, { desc = "Format file or range (in visual mode)" })
        end
    }
}
