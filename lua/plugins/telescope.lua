return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local builtin = require("telescope.builtin")
            local utils = require("utils")

            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            -- Enable telescope extensions, if they are installed
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            utils.remap("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
            utils.remap("<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
            utils.remap("<leader>sf", builtin.find_files, "[S]earch [F]iles")
            utils.remap("<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
            utils.remap("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
            utils.remap("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")
            utils.remap("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
            utils.remap("<leader>sr", builtin.resume, "[S]earch [R]esume")
            utils.remap("<leader>s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
            utils.remap("<leader>bb", builtin.buffers, "Show existing buffers")

            -- Slightly advanced example of overriding default behavior and theme
            utils.remap("<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, "[/] Fuzzily search in current buffer")

            -- Also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            utils.remap("<leader>s/", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end, "[S]earch [/] in Open Files")

            -- Shortcut for searching your neovim configuration files
            utils.remap("<leader>sn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end, "[S]earch [N]eovim files")
        end,
    },
}
