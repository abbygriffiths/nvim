local opt = vim.opt

-- font
opt.guifont = "Iosevka:h17"

-- indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line numbers
opt.number = true

-- system clipboard
opt.clipboard:append "unnamedplus"

-- colors and colorscheme
vim.opt.termguicolors = true
