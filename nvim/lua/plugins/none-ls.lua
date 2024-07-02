return {
    'nvimtools/none-ls.nvim',
    config = function()
        local none_ls = require("null-ls")
        local autogroup = vim.api.nvim_create_augroup("LspFormatting", {})
        none_ls.setup({
            sources = {
                none_ls.builtins.formatting.black,
                none_ls.builtins.diagnostics.mypy.with({
                    extra_args = function()
                        local virtual = os.getenv("VIRTUAL_ENV") or
                                            os.getenv("CONDA_PREFIX") or "/usr"
                        return {
                            "--python-executable", virtual .. "/bin/python3"
                        }
                    end
                })
            },
            on_attach = function(client, bufnr)
                if (client.supports_method("textDocument/formatting")) then
                    vim.api.nvim_clear_autocmds({
                        group = autogroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = autogroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({bufnr = bufnr})
                        end
                    })
                end
            end
        })
    end
}
