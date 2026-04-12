return {
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    {
        -- Serve para habilitar automaticamente os lsp instalados, e usar o comando :LspInstall
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        opts = {},
    },

    {

        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
            { "saghen/blink.cmp" },
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.lsp.config("lua_ls", { capabilities = capabilities })
            vim.lsp.config("r_language_server", { capabilities = capabilities })
            vim.lsp.config("pyright", { capabilities = capabilities })
            vim.lsp.config("texlab", { capabilities = capabilities })

            -- lspconfig['lua_ls'].setup({ capabilities = capabilities })
            -- lspconfig.r_language_server.setup({ capabilities = capabilities })
            -- lspconfig.pyright.setup({ capabilities = capabilities })
            -- lspconfig.texlab.setup({ capabilities = capabilities })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("my.lsp", {}),
                callback = function(args)
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    if
                        not client:supports_method("textDocument/willSaveWaitUntil")
                        and client:supports_method("textDocument/formatting")
                    then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                            end,
                        })
                    end
                end,
            })
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "lua-language-server",
                    "vim-language-server",
                    "stylua",
                    "shellcheck",
                    "shellcheck",
                    "shfmt",
                    "vint",
                },
            })
        end,
    },
}
