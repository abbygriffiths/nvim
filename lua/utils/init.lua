M = {}

M.remap = function(keys, cmd, desc)
    vim.keymap.set("n", keys, cmd, { desc = desc })
end

return M
