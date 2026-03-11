return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope Find Files" })

        vim.keymap.set("n", "<leader>pg", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Grep String" })
    end,
}
