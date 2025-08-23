return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- ленивый старт
    config = function()
        local lspconfig = require("lspconfig")

        vim.diagnostic.config({
            virtual_text = { spacing = 2, source = "if_many" },
            float = { border = "none", source = "if_many" },
            severity_sort = true,
            update_in_insert = false,
            underline = true,
            signs = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local buf = event.buf

                local opts = { buffer = buf, silent = true, noremap = true }
                local function map(mode, lhs, rhs, desc)
                    opts.desc = desc
                    vim.keymap.set(mode, lhs, rhs, opts)
                end

                map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
                map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
                map("n", "gr", vim.lsp.buf.references, "References")
                map("n", "gI", vim.lsp.buf.implementation, "Go to Implementation")
                map("n", "gy", vim.lsp.buf.type_definition, "Type Definition")
                map("n", "K", vim.lsp.buf.hover, "Hover Docs")
                map("n", "gl", vim.diagnostic.open_float, "Line Diagnostics")
                map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
                map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
                map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
                map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature Help")
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
        if ok_cmp then
            capabilities = cmp.default_capabilities(capabilities)
        end

        local servers = {
            gopls = {
                settings = {
                    gopls = {
                        analyses = { unusedparams = true, nilness = true, unusedwrite = true, shadow = true },
                        codelenses = {
                            gc_details = true,
                            generate = true,
                            regenerate_cgo = true,
                            tidy = true,
                            upgrade_dependency = true,
                            vendor = true,
                        },
                        -- hints = {
                        -- 	assignVariableTypes = true,
                        -- 	parameterNames = true,
                        -- 	rangeVariableTypes = true,
                        -- 	compositeLiteralFields = true,
                        -- 	constantValues = true,
                        -- },
                        staticcheck = true,
                        directoryFilters = { "-.git", "-node_modules" },
                        usePlaceholders = true,
                    },
                },
            },
            -- clangd = {
            -- 	cmd = { "clangd", "--header-insertion=never", "--offset-encoding=utf-16" },
            -- 	init_options = { clangdFileStatus = true },
            -- },
            pyright = {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoImportCompletions = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = { enable = false },
                        hint = { enable = true },
                        completion = { callSnippet = "Replace" },
                    },
                },
            },
        }

        for server, cfg in pairs(servers) do
            cfg.capabilities = capabilities
            cfg.handlers = handlers
            cfg.flags = { debounce_text_changes = 150 }
            lspconfig[server].setup(cfg)
        end
    end,
}
