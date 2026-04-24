return {
    "R-nvim/R.nvim",
    lazy = false,
    config = function()
        local opts = {
            auto_start = "no",
            hook = {
                on_filetype = function()
                    vim.api.nvim_buf_set_keymap(0, "n", "<C-CR>", "<Plug>RDSendLine", {})
                    vim.api.nvim_buf_set_keymap(0, "v", "<C-CR>", "<Plug>RSendSelection", {})
                end,
            },
            r_ls = {
                completion = false,
                hover = false,
                signature = false,
                implementation = false,
                definition = false,
                references = false,
                document_highlight = false,
                document_symbol = false,
                workspace_symbol = false,
                rename = false,
            },
            R_args = { "--quiet", "--no-save" },
            min_editor_width = 72,
            rconsole_width = 0,
            rconsole_height = 15,
            objbr_mappings = {
                c = "class",
                ["<localleader>gg"] = "head({object}, n = 15)",
                v = function()
                    require("r.browser").toggle_view()
                end,
            },
            disable_cmds = {
                "RClearConsole",
                "RCustomStart",
                "RSPlot",
                "RSaveClose",
            },
        }

        if vim.env.R_AUTO_START == "true" then
            opts.auto_start = "on startup"
            opts.objbr_auto_start = true
        end

        require("r").setup(opts)

        -- make plot region
        vim.keymap.set("n", "<leader>rf", function()
            vim.cmd("normal \\rf")

            vim.defer_fn(function()
                vim.cmd("normal \\ro")

                vim.cmd("wincmd j")

                vim.cmd("vnew")

                vim.cmd("vertical resize -15")

                vim.cmd("wincmd -")

                vim.cmd("wincmd k")

                vim.cmd("wincmd h")
            end, 400)
        end)

        vim.keymap.set("n", "<leader>rq", function()
            vim.cmd("normal \\rq")

            vim.defer_fn(function()
                vim.cmd("q")
            end, 200)
        end)
    end,
}
