return {
    "nvimtools/none-ls.nvim",
    config = true,
    opts = function(_, opts)
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = vim.list_extend(opts.sources or {}, {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort.with({ extra_args = { "--profile", "black" } }),
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.prettier,
            }),
        })
    end,
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function(_, opts)
            require("mason-null-ls").setup(opts)
        end,
        opts = {
            automatic_installation = true,
            automatic_setup = false,
            ensure_installed = { "black", "isort" },
        },
    },
}
