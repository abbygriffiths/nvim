return {
    "williamboman/mason-lspconfig.nvim",
    version = "^2.3.0",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        { "neovim/nvim-lspconfig" },
        { "j-hui/fidget.nvim", opts = {} },
    },
    opts = {
        ensure_installed = { "pyright", "lua_ls" },
        automatic_installation = true,
        automatic_enable = true,
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Allow folding capability
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = false,
        }

        local servers = require("mason-lspconfig").get_installed_servers()
        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities,
            })
            vim.lsp.enable({ server })
        end

        vim.lsp.config("ruff", {
            init_options = {
                settings = {
                    line_length = 100,
                    target_version = "py312",
                    extend_include = {
                        "docs",
                        "db",
                        "legacy_bridge.py",
                        "tests",
                        "utilities",
                    },
                    lint = {
                        select = {
                            "E",
                            "W",
                            "F",
                            "I",
                            "B",
                            "C4",
                            "UP",
                        },
                        ignore = {
                            "C901",
                            "B008",
                            "UP042",
                            "E501",
                        },
                    },
                    format = {
                        quote_style = "double",
                        indent_style = "space",
                        skip_magic_trailing_comma = false,
                        line_ending = "auto",
                    },
                },
            },
        })
        vim.lsp.enable("ruff")

        vim.lsp.config("pyright", {
            settings = {
                pyright = {
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        ignore = { "*" },
                    },
                },
            },
        })

        -- vim.api.nvim_create_autocmd("LspAttach", {
        --   group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
        --   callback = function(args)
        --     local client = vim.lsp.get_client_by_id(args.data.client_id)
        --     if client == nil then
        --       return
        --     end
        --     if client.name == 'ruff' then
        --       -- Disable hover in favor of Pyright
        --       client.server_capabilities.hoverProvider = false
        --     end
        --   end,
        --   desc = 'LSP: Disable hover capability from Ruff',
        -- })

        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
        vim.keymap.set("n", "<leader>mca", vim.lsp.buf.code_action, {})

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(event)
                local builtin = require("telescope.builtin")

                vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "[g]oto [d]efinition" })
                vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "[g]oto [r]eferences" })
                vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "[g]oto [D]eclaration" })
                vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "[g]oto [i]mplementation" })

                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        callback = vim.lsp.buf.clear_references,
                    })
                end

                vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show info about thing below cursor" })
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = event.buf })
                vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = event.buf })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
                vim.keymap.set("n", ",ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

                vim.keymap.set("n", ",==", function()
                    vim.lsp.buf.format({ async = true })
                end, { desc = "Format Buffer" })
            end,
        })

        require("ufo").setup()
    end,
}
