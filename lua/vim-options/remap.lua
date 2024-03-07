vim.g.mapleader = " "

local utils = require("utils")

-- basic
utils.remap("<leader>qq", vim.cmd.qa, "Quit")

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- files
utils.remap("<leader>fs", vim.cmd.w, "[f]ile [s]ave")
utils.remap("<leader>fS", vim.cmd.wa, "[f]ile [S]ave all")
utils.remap("<leader>pf", vim.cmd.Ex, "[p]roject [f]iles")

-- windows
utils.remap("<leader>wd", vim.cmd.q, "[w]indow [d]elete")
utils.remap("<leader>w-", vim.cmd.split, "Split horizontally")
utils.remap("<leader>w/", vim.cmd.vsplit, "Split vertically")

-- window navigation
utils.remap("<leader>wh", function()
    vim.cmd(":wincmd h")
end, "Focus on left window")
utils.remap("<leader>wj", function()
    vim.cmd(":wincmd j")
end, "Focus on bottom window")
utils.remap("<leader>wk", function()
    vim.cmd(":wincmd k")
end, "Focus on top window")
utils.remap("<leader>wl", function()
    vim.cmd(":wincmd l")
end, "Focus on right window")
