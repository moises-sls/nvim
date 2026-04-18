return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- Alterado de yarn para npm
    build = "cd app && npm install",
    init = function()
        vim.g.mkdp_filetypes = { "rmd", "markdown" }
        vim.g.mkdp_auto_start = 1
        vim.g.mkdp_command_for_global = 1
    end,
    ft = { "rmd", "markdown" },
}
