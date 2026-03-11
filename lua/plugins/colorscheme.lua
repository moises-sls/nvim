return {
        {
                "webhooked/kanso.nvim",
                lazy = false,
                priority = 1000,
                config = function()
                        vim.cmd("colorscheme kanso-zen")
                        require("kanso").setup({
                                foreground = {
                                        dark = "saturated",
                                        light = "saturated",
                                },
                                transparent = true,

                                overrides = function(colors)
                                        return {
                                                CursorLine = { bg = "#363638" },
                                                CursorLineNr = { fg = "#FFFF00", bg = "#363638" },
                                                LineNrAbove = { fg = "#AAAA00" },
                                                LineNrBellow = { fg = "#ababab" },
                                        }
                                end,
                        })

                        -- vim.cmd("colorscheme kanso-ink")
                        -- vim.cmd("colorscheme kanso-mist")
                        -- vim.cmd("colorscheme kanso-pearl")
                end,
        },
}
