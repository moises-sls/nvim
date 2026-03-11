return {
    "nvim-tree/nvim-tree.lua",
    lazy = false, -- Set to true if you want to lazy-load it, but false is common for file explorers
    dependencies = { -- 'requires' is deprecated, use 'dependencies'
        "nvim-tree/nvim-web-devicons",
    },

    keys = {
        {
            "<leader>t",
            function()
                vim.cmd("NvimTreeToggle") -- This is the command to toggle NvimTree
            end,
            desc = "Toggle NvimTree", -- A description for which-key or similar
        },
    },

   config = function()
        require("nvim-tree").setup({})
    end,
}
