-- Set up nvim-cmp for autocompletion
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    },
    formatting = {
        format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                path = "[Path]",
                luasnip = "[Snippet]",
            },
        }),
    },
})

-- Set up LSP servers
local lspconfig = require("lspconfig")

-- Enable format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- Use null-ls for formatting if available
            return client.name == "null-ls"
        end,
        bufnr = bufnr,
        async = false,
    })
end

-- null-ls setup for formatting using external tools like Prettier
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- Prettier for JavaScript and TypeScript
        null_ls.builtins.formatting.prettierd.with({
            filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "html", "css" },
        }),
        -- Stylua for formatting Lua
        null_ls.builtins.formatting.stylua.with({
            extra_args = { "--indent-type", "Spaces", "--indent-width", "4" }, -- Customize arguments here
        }),
        -- Terraform fmt para formatear archivos .tf
        null_ls.builtins.formatting.terraform_fmt,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end,
})

-- Attach the format-on-save functionality to all LSPs that support it
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                lsp_formatting(bufnr)
            end,
        })
    end
end

-- Use `ts_ls` instead of `tsserver`
lspconfig.ts_ls.setup({
    on_attach = function(client, bufnr)
        -- Disable formatting from tsserver to avoid conflicts with null-ls
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client, bufnr)
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    -- Exclude node_modules and other heavy directories
    root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
    settings = {
        -- Exclude large directories like node_modules
        typescript = {
            preferences = {
                disableSuggestions = true,
            },
        },
    },
    flags = {
        debounce_text_changes = 150, -- Debounce to reduce CPU usage for large files
    },
})

-- Use `lua_ls` instead of `sumneko_lua`
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- Exclude unnecessary files from workspace library
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false, -- Avoid checking unnecessary libraries
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- Terraform LSP setup
lspconfig.terraformls.setup({
    on_attach = function(client, bufnr)
        -- Habilitar formato en guardado
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    lsp_formatting(bufnr)
                end,
            })
        end
    end,
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    -- Exclude node_modules and other unnecessary directories
    root_dir = lspconfig.util.root_pattern(".terraform", ".git"),
    flags = {
        debounce_text_changes = 150, -- Reduce frequent diagnostic updates
    },
})

-- Disable diagnostics for node_modules and other large directories globally
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
    pattern = { "*/node_modules/*", "*/dist/*", "*/.git/*" },
    callback = function()
        vim.diagnostic.disable(0)
    end,
})
