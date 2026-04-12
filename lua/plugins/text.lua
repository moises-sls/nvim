return {

    ------------------------- Comment
    {
        "nvim-mini/mini.comment",
        version = false,
        config = function()
            require("mini.comment").setup({})
        end,
    },

    ------------------------- AutoPairs

    {

        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
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
