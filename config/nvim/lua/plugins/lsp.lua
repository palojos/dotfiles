return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = {
                "ruff",
                "pyright",
                "ts_ls",
                "lua_ls"
            },
        })

        vim.lsp.config("lua_ls", {
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_markers = { ".luarc.json", ".luarc.jsonc", ".stylua.toml", "stylua.toml", ".git" },
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT", -- Neovim uses LuaJIT
                    },
                    diagnostics = {
                        globals = { "vim" }, -- Stop "Undefined global vim" warnings
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true), -- Enable auto-complete for Neovim runtime API
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        vim.lsp.config("hls", {
            cmd = { "haskell-language-server-wrapper", "--lsp" },
            filetypes = { "haskell", "lhaskell", "cabal" },
            root_markers = { "hie.yaml", "stack.yaml", "cabal.project", "*.cabal" },
            settings = {
                haskell = {
                    formattingProvider = "ormolu",
                    plugin = {
                        hlint = { globalOn = true },
                    },
                },
            },
        })

        vim.lsp.config("racket_langserver", {
            cmd = { "racket", "--lib", "racket-langserver" },
            filetypes = { "racket", "scheme" },
            root_markers = { "info.rkt" },
        })

        vim.lsp.config("ruff", {
            cmd = { "ruff", "server" },
            filetypes = { "python" },
            on_attach = function(client, _)
                client.server_capabilities.hvoerProvider = false
            end,
        })

        vim.lsp.enable({ "racket_langserver", "pyright", "ruff", "ts_ls", "hls", "lua_ls" })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local buf = args.buf

                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "View docs / types" })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code actions" })
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = buf, desc = "View line errors" })
                vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = buf, desc = "Format current buffer" })

                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = buf,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = buf, timeout_ms = 2000 })
                    end,
                })
            end,
        })
    end,
}
