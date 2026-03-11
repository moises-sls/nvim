local trigger_text = ';'

return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- build = "make install_jsregexp",
        -- dependencies = { "rafamadriz/friendly-snippets", },

        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
        end,
    },

    {

        'saghen/blink.cmp',
        -- dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',

        opts = {
            keymap = { preset = 'default' },

            appearance = {
                nerd_font_variant = 'mono'
            },

            completion = { documentation = { auto_show = true } },

            sources = {
                default = { 'snippets', 'lsp', 'path', 'buffer' },

                providers = {
                    snippets = {
                        score_offset = 100,
                        -- Only show snippets if I type the trigger_text characters
                        should_show_items = function()
                            local col = vim.api.nvim_win_get_cursor(0)[2]
                            local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
                            return before_cursor:match(trigger_text .. '%w*$') ~= nil
                        end,
                        -- After accepting the completion, delete the trigger_text characters
                        transform_items = function(_, items)
                            local line = vim.api.nvim_get_current_line()
                            local col = vim.api.nvim_win_get_cursor(0)[2]
                            local before_cursor = line:sub(1, col)
                            local start_pos, end_pos = before_cursor:find(trigger_text .. '[^' .. trigger_text .. ']*$')
                            if start_pos then
                                for _, item in ipairs(items) do
                                    if not item.trigger_text_modified then
                                        ---@diagnostic disable-next-line: inject-field
                                        item.trigger_text_modified = true
                                        item.textEdit = {
                                            newText = item.insertText or item.label,
                                            range = {
                                                start = { line = vim.fn.line '.' - 1, character = start_pos - 1 },
                                                ---@diagnostic disable-next-line: assign-type-mismatch
                                                ['end'] = { line = vim.fn.line '.' - 1, character = end_pos },
                                            },
                                        }
                                    end
                                end
                            end
                            return items
                        end,

                    }

                },

            },

            fuzzy = {
                implementation = "lua",
            },
        },
        opts_extend = { "sources.default" }

    }
}
