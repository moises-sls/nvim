return {
    -- "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
    -- branch = "master",
    -- opts = {
    --     highlight = { enable = true },
    --     indent = { enable = true },
    --     auto_install = { true },
    --     ensure_installed = {
    --         "r",
    --         "python",
    --         "markdown",
    --         "markdown_inline",
    --         "bash",
    --         "yaml",
    --         "lua",
    --         "vim",
    --         "query",
    --         "vimdoc",
    --         "latex",
    --         "html",
    --     },
    -- },
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local langs = { "markdown", "markdown_inline", "r", "rnoweb", "yaml", "latex", "csv" }
        require("nvim-treesitter").install(langs)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = langs,
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
