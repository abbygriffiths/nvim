local opt = vim.opt

-- font
opt.guifont = "Iosevka:h17"

opt.foldmethod = "expr"
opt.foldexpr = "lua vim.treesitter.foldexpr()"
opt.foldtext = "lua vim.treesitter.foldtext()"

-- indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line numbers
opt.number = true

-- system clipboard
opt.clipboard:append("unnamedplus")

-- colors and colorscheme
opt.termguicolors = true
