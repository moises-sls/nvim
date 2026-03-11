return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "rmd", "markdown" }
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_command_for_global = 1


  end,
  ft = { "rmd", "markdown" },
}
