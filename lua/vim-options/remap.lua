vim.g.mapleader = " "

-- basic
vim.keymap.set("n", "<leader>qq", vim.cmd.qa)

-- files
vim.keymap.set("n", "<leader>fs", vim.cmd.w)
vim.keymap.set("n", "<leader>fS", vim.cmd.wa)
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)

-- windows
vim.keymap.set("n", "<leader>wd", vim.cmd.q)
vim.keymap.set("n", "<leader>w-", vim.cmd.split)
vim.keymap.set("n", "<leader>w/", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>wh", vim.cmd.wincmd("h"))

-- buffers
vim.keymap.set("n", "<leader>bb", vim.cmd.buffers)
