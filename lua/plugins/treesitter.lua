return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- setup treesitter
        local treesitter_config = require("nvim-treesitter.configs")
        treesitter_config.setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            sync_install = true,
            ensure_installed = {},
            ignore_install = {},
            modules = {}
        })
    end,
}
