return {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    config = function()
        vim.g.molten_image_provider = "image.nvim"

        vim.g.molten_auto_open_output = true

        vim.g.molten_output_win_max_height = 20

        vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>",
            { silent = true, desc = "Initialize the plugin" })

        vim.keymap.set("n", "<localleader>me", ":MoltenEvaluateOperator<CR>",
            { silent = true, desc = "run operator selection" })

        vim.keymap.set("n", "<localleader>ml", ":MoltenEvaluateLine<CR>",
            { silent = true, desc = "evaluate line" })

        vim.keymap.set("v", "<localleader>mr", ":<C-u>MoltenEvaluateVisual<CR>gv",
            { silent = true, desc = "evaluate visual selection" })

        vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>",
            { silent = true, desc = "molten delete cell" })

        vim.keymap.set("n", "<localleader>mh", ":MoltenHideOutput<CR>",
            { silent = true, desc = "hide output" })

        vim.keymap.set("n", "<localleader>ms", ":noautocmd MoltenEnterOutput<CR>",
            { silent = true, desc = "show/enter output" })

        vim.keymap.set("n", "<localleader>mr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
    end,
}






-- return {
--     {
--         "benlubas/molten-nvim",
--         -- enabled = false,
--         dependencies = { "image.nvim" },
--         ft = { "python", "norg", "markdown", "quarto" }, -- this is just to avoid loading image.nvim, loading molten at the start has minimal startup time impact
--         -- dev = true,
--         init = function()
--             -- vim.g.molten_cover_empty_lines = true
--             -- vim.g.molten_comment_string = "# %%"
--             vim.keymap.set({ "v", "n" }, "<leader><leader>R", "<Cmd>MoltenEvaluateVisual<CR>")
--
--             -- vim.g.molten_auto_image_popup = true
--             -- vim.g.molten_show_mimetype_debug = true
--             vim.g.molten_auto_open_output = false
--             vim.g.molten_image_location = "float"
--             vim.g.molten_image_provider = "image.nvim"
--             -- vim.g.molten_output_show_more = true
--             vim.g.molten_output_win_border = { "", "━", "", "" }
--             vim.g.molten_output_win_max_height = 12
--             -- vim.g.molten_output_virt_lines = true
--             vim.g.molten_virt_text_output = true
--             vim.g.molten_use_border_highlights = true
--             vim.g.molten_virt_lines_off_by_1 = true
--             vim.g.molten_wrap_output = true
--             vim.g.molten_tick_rate = 142
--
--             vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { desc = "Initialize Molten", silent = true })
--
--             vim.keymap.set("n", "<localleader>ip", function()
--                 local venv = os.getenv("VIRTUAL_ENV")
--                 if venv ~= nil then
--                     -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
--                     venv = string.match(venv, "/.+/(.+)")
--                     vim.cmd(("MoltenInit %s"):format(venv))
--                 else
--                     vim.cmd("MoltenInit python3")
--                 end
--             end, { desc = "Initialize Molten for python3", silent = true, noremap = true })
--
--             vim.api.nvim_create_autocmd("User", {
--                 pattern = "MoltenInitPost",
--                 callback = function()
--                     -- quarto code runner mappings
--                     local r = require("quarto.runner")
--                     vim.keymap.set("n", "<localleader>qrc", r.run_cell, { desc = "run cell", silent = true })
--                     vim.keymap.set("n", "<localleader>qra", r.run_above, { desc = "run cell and above", silent = true })
--                     vim.keymap.set("n", "<localleader>qrb", r.run_below, { desc = "run cell and below", silent = true })
--                     vim.keymap.set("n", "<localleader>qrl", r.run_line, { desc = "run line", silent = true })
--                     vim.keymap.set("n", "<localleader>qrA", r.run_all, { desc = "run all cells", silent = true })
--                     vim.keymap.set("n", "<localleader>qRA", function()
--                         r.run_all(true)
--                     end, { desc = "run all cells of all languages", silent = true })
--
--
--                     -- if we're in a python file, change the configuration a little
--                     if vim.bo.filetype == "python" then
--                         vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", false)
--                         vim.fn.MoltenUpdateOption("molten_virt_text_output", false)
--                     end
--                 end,
--             })
--
--             -- change the configuration when editing a python file
--             vim.api.nvim_create_autocmd("BufEnter", {
--                 pattern = "*.py",
--                 callback = function(e)
--                     if string.match(e.file, ".otter.") then
--                         return
--                     end
--                     if require("molten.status").initialized() == "Molten" then
--                         vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", false)
--                         vim.fn.MoltenUpdateOption("molten_virt_text_output", false)
--                     end
--                 end,
--             })
--
--             -- Undo those config changes when we go back to a markdown or quarto file
--             vim.api.nvim_create_autocmd("BufEnter", {
--                 pattern = { "*.qmd", "*.md", "*.ipynb" },
--                 callback = function()
--                     if require("molten.status").initialized() == "Molten" then
--                         vim.fn.MoltenUpdateOption("molten_virt_lines_off_by_1", true)
--                         vim.fn.MoltenUpdateOption("molten_virt_text_output", true)
--                     end
--                 end,
--             })
--         end,
--     },
-- }
