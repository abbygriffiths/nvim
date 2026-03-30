return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            auto_integrations = true,
        })
    end,
}

-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     config = function()
--         require("catppuccin").setup({
--             flavour = "mocha",
--         })
--     end,
--     opts = { flavour = "mocha" },
-- }
