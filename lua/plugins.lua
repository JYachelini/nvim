-- Packer initialization
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- theme
    use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }

    -- nvim-lspconfig for LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP

    -- Autocompletion plugins
    use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'       -- Buffer completions
    use 'hrsh7th/cmp-path'         -- Path completions
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completions
    use 'L3MON4D3/LuaSnip'         -- Snippet engine
    use 'onsails/lspkind-nvim'     -- Icons for autocompletion items

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Harpoon
    use({ "ThePrimeagen/harpoon", branch = "harpoon2", requires = { "nvim-lua/plenary.nvim" } })

    -- vim-surround
    use("tpope/vim-surround")

    -- Gitsigns
    use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

    -- ToggleTerm
    use({ "akinsho/toggleterm.nvim", tag = "v2.*" })

    -- Lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Autopairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    -- Codeium (AI autocompletion)
    use {
        'Exafunction/codeium.vim',
        config = function()
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
                { expr = true, silent = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    }

    -- null-ls for formatting using external tools like Prettier
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    })
end)
