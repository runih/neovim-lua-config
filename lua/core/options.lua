local opt = vim.opt -- for conciseness

-- buffers
-- Change the working directory to the buffer that gets open
-- There seems to be a bug with this and Neo-Tree
opt.autochdir = false

-- line numbers
opt.relativenumber = true
opt.number = true

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showtabline = 0

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true

-- opt.iskeyword:append("-")

-- Open help window in a vertical split to the right.
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == 'help' then vim.cmd.wincmd("L") end
    end
})
