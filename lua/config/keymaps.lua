vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "No Highlight Search" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Previous page" })

vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Write and Quit" })

vim.keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Write" })

vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Quit without saving " })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- vim.keymap.set("n", "<leader>sf", function()
--     require("telescope.builtin").lsp_document_symbols({
--         symbols = {
--             "Function",
--             "Method",
--         },
--     })
-- end, { desc = "List functions/methods in current buffer" })

vim.keymap.set("n", "<leader>sf", ":Telescope lsp_document_symbols<CR>")
