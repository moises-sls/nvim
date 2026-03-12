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

                        CursorLine = { bg = "#0f0f0f" },
                        CursorLineNr = { fg = "#FFFF00", bg = "#0f0f0f" },
                        LineNrAbove = { fg = "#AAAA00" },
                        LineNrBellow = { fg = "#ababab" },
                        -- String = { fg = "#9cc99b" },
                        Search = { fg = "#b0b0b0", bg = "#000000" },
                        IncSearch = { fg = "#b0b0b0", bg = "#000000" },
                        Substitute = { fg = "#00efff", bg = "#363638" },

                        -- CursorLine = { bg = "#363638" },
                        -- CursorLineNr = { fg = "#FFFF00", bg = "#363638" },
                        -- LineNrAbove = { fg = "#AAAA00" },
                        -- LineNrBellow = { fg = "#ababab" },
                    }
                end,
            })

            -- vim.cmd("colorscheme kanso-ink")
            -- vim.cmd("colorscheme kanso-mist")
            -- vim.cmd("colorscheme kanso-pearl")
        end,
    },
    --
    -- {
    --     "metalelf0/black-metal-theme-neovim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("black-metal").setup({
    --             theme = "gorgoroth",
    --
    --             highlights = {
    --                 CursorLine = { bg = "#0f0f0f" },
    --                 CursorLineNr = { fg = "#FFFF00", bg = "#0f0f0f" },
    --                 LineNrAbove = { fg = "#AAAA00" },
    --                 LineNrBellow = { fg = "#ababab" },
    --                 -- String = { fg = "#9cc99b" },
    --                 Search = { fg = "#b0b0b0", bg = "#000000" },
    --                 IncSearch = { fg = "#b0b0b0", bg = "#000000" },
    --                 Substitute = { fg = "#00efff ", bg = "#000000" },
    --             },
    --         })
    --
    --         require("black-metal").load()
    --     end,
    -- },
}
