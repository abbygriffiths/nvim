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

-- window navigation
vim.keymap.set("n", "<leader>wh", function()
    vim.cmd(":wincmd h")
end)
vim.keymap.set("n", "<leader>wj", function()
    vim.cmd(":wincmd j")
end)
vim.keymap.set("n", "<leader>wk", function()
    vim.cmd(":wincmd k")
end)
vim.keymap.set("n", "<leader>wl", function()
    vim.cmd(":wincmd l")
end)

-- buffers
vim.keymap.set("n", "<leader>bb", ":buffers<CR>:buffer<Space>")
