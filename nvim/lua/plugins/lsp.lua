return {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' }, -- Autocompletion
        { 'hrsh7th/nvim-cmp' }, { 'hrsh7th/cmp-nvim-lsp' }, { 'L3MON4D3/LuaSnip' },
        -- Autocompletion
        { "hrsh7th/cmp-buffer" }, { "hrsh7th/cmp-path" }, { "hrsh7th/cmp-cmdline" }
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws",
                function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd",
                function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function()
                vim.diagnostic.goto_next()
            end, opts)
            vim.keymap.set("n", "]d", function()
                vim.diagnostic.goto_prev()
            end, opts)
            vim.keymap.set("n", "<leader>vca",
                function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr",
                function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn",
                function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>",
                function() vim.lsp.buf.signature_help() end, opts)
        end)

        require('mason').setup({ opts = { ensure_installed = { "mypy", "ruff" } } })

        require('mason-lspconfig').setup({
            ensure_installed = {
                'tsserver', 'rust_analyzer', 'pyright', "eslint",
                "kotlin_language_server", "lua_ls", "html", "tailwindcss",
                "dockerls", "bashls"
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls({
                        on_init = function(client)
                            local path = client.workspace_folders[1].name
                            if vim.loop.fs_stat(path .. '/.luarc.json') or
                                vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                                return
                            end

                            client.config.settings.Lua =
                            vim.tbl_deep_extend('force',
                                client.config.settings.Lua,
                                {
                                    runtime = { version = 'LuaJIT' },
                                    workspace = {
                                        checkThirdParty = false,
                                        library = {
                                            vim.env.VIMRUNTIME,
                                            "${3rd}/luv/library"
                                        }
                                    }
                                })
                        end
                    })
                    require('lspconfig').lua_ls.setup(lua_opts)
                end
            }
        })

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        -- `/` cmdline setup.
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } }
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" } }, {
                { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } }
            })
        })

        cmp.setup({
            sources = {
                { name = 'path' }, { name = 'nvim_lsp' }, { name = 'nvim_lua' },
                { name = "crates" }
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete()
            })
        })

    end
}
