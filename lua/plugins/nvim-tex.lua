return {
  "lervag/vimtex",
  ft = { "tex", "qmd" }, -- This ensures it loads only for .tex files

  opts = {},

  config = function()
    vim.cmd [[set foldmethod=expr]]
    vim.cmd [[set foldexpr=vimtex#fold#level(v:lnum)]]
    vim.cmd [[set foldtext=vimtex#fold#text()]]
    vim.g.vimtex_view_method = 'zathura'
  end,
}
