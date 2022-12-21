local opt = vim.opt -- for conciseness

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

-- appearance
-- Installing Nerd font:
--      brew tap homebrew/cask-fonts
--      brew install --cask font-hack-nerd-font
if not string.find(vim.env.VIM, "VimR") then
  -- Don't change the font for VimR
  opt.guifont = { "Hack Nerd Font Mono", ":h16" }
end
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
