return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        {
            "s1n7ax/nvim-window-picker",
            name = "window-picker",
            event = "VeryLazy",
            version = "2.*",
            opts = {
                hint = "floating-big-letter",
            },
        },
    },
    config = function()
        local utils = require("utils")
        utils.remap("<leader>ft", vim.cmd.Neotree, "Show [f]ile [t]ree")
    end,
}
