-- General options
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.signcolumn = "yes"                                      -- Recommended for linters/diagnostics

vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20" -- Change cursor line in insert mode to a block

vim.opt.scrolloff = 15                                          -- Keep 8 lines above and below the cursor visible

-- Indentation options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Other useful options
vim.opt.number = true                                  -- Show line numbers
vim.opt.relativenumber = true                          -- Show relative line numbers
vim.opt.mouse = "a"                                    -- Enable mouse in all modes
vim.opt.cursorline = true                              -- Highlight currentline
vim.opt.splitright = true                              -- New vertical splits open to the right
vim.opt.splitbelow = true                              -- New horizontal splits open below
vim.opt.termguicolors = true                           -- Enable true colors (required for many colorschemes)
vim.opt.cmdheight = 1                                  -- Command line height
vim.opt.updatetime = 300                               -- Faster completion pop-up
vim.opt.timeoutlen = 500                               -- Time to wait for a mapped sequence
vim.opt.incsearch = true                               -- Incremental search
vim.opt.hlsearch = true                                -- Highlight search results
vim.opt.ignorecase = true                              -- Ignore case in search patterns
vim.opt.smartcase = true                               -- Don't ignore case if search pattern contains upper case characters
vim.opt.undofile = true                                -- Persistent undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir" -- Directory for undo files

-- visual diagnosis
vim.diagnostic.config({
    virtual_text = {
        enable = true,
        severity = {
            min = vim.diagnostic.severity.INFO, -- Show INFO, WARNING, ERROR
        },
    },
    signs = {
        enable = true,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        border = "single",
        focusable = false,
        source = "always",
    },
})

-- Corretor
local spell_filetypes = { "text", "tex", "plaintex", "typst", "gitcommit", "markdown" }

vim.api.nvim_create_augroup("Spellcheck", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "Spellcheck",
    pattern = spell_filetypes,
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "pt_br"
    end,
})

vim.opt.spell = false
