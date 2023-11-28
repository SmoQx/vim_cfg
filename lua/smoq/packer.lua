-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup({
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
        })
    end}

    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    })

    use {
        "bluz71/vim-nightfly-colors",
        as = 'nightfly',
    }
    
    use {
        'Mofiqul/dracula.nvim' 
    }

    use { 
        'nvim-treesitter/nvim-treesitter', 
        {run = ':TSUpdate'}
    }
    use('ThePrimeagen/harpoon')

    use{
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'neovim/nvim-lspconfig' },
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            --Debugging
            { 'simrat39/rust-tools.nvim' },
        }

    }
end)
