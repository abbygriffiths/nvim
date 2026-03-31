-- Start Treesitter automatically for the listed file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "lua", "bash", "gitignore", "json", "yaml", "shell" },
    callback = function()
        vim.treesitter.start()
    end,
})

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
}
