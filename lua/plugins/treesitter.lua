return{
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
    opts = {
        highlight = {enable = true},
        indent = { enable = true},
        auto_install = {true},
        ensure_installed = {
            'r',
            'python',
            'markdown',
            'markdown_inline',
            'bash',
            'yaml',
            'lua',
            'vim',
            'query',
            'vimdoc',
            'latex', 
            'html',
        },
        auto_install = true,
    }
}
