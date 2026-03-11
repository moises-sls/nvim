return {

    ------------------------- Comment
    {
        'numToStr/Comment.nvim',
        opts = {},

        config = function()
            require('Comment').setup({})
        end,

    },

    ------------------------- AutoPairs

    {

        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true


    },

    ------------------------- Surround
    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
}
