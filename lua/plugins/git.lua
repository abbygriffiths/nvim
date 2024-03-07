return {
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gs = require("gitsigns")
            local utils = require("utils")

            utils.remap("<leader>gp", gs.preview_hunk, "[g]it [p]review hunk")
            utils.remap("<leader>gt", gs.toggle_current_line_blame, "[g]it [t]oggle current line blame")
        end,

        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },
}
