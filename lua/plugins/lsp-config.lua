return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", opts = {} },
            {
                "williamboman/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "gopls", "clangd" },
                },
            },
            { "j-hui/fidget.nvim", opts = {} },
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            local lspconfig = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Allow folding capability
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            local servers = { "pyright", "lua_ls", "ruby_ls", "rust_analyzer", "gopls" }
            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end
--[[ 
            -- setup the lsps
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.ruby_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
 ]]
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>mca", vim.lsp.buf.code_action, {})

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(event)
                    local map = function(keys, cmd, desc)
                        vim.keymap.set("n", keys, cmd, { desc = desc, buffer = event.buf })
                    end

                    local builtin = require("telescope.builtin")

                    map("<leader>gd", builtin.lsp_definitions, "[g]oto [d]efinition")
                    map("<leader>gr", builtin.lsp_references, "[g]oto [r]eferences")
                    map("<leader>gd", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
                    map("<leader>gi", builtin.lsp_implementations, "[g]oto [i]mplementation")

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

                    map("K", vim.lsp.buf.hover, "Show info about thing below cursor")
                    map("<C-k>", vim.lsp.buf.signature_help, { buffer = event.buf })
                    map("<leader>D", vim.lsp.buf.type_definition, { buffer = event.buf })
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>,ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                    map(",==", function()
                        vim.lsp.buf.format({ async = true })
                    end, "Format Buffer")
                end,
            })

            require("ufo").setup()
        end,
    },
}
