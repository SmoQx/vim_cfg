return{
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
        -- Uncomment these if you want to manage LSP servers from neovim
        { 'neovim/nvim-lspconfig' },
        {'williamboman/mason-lspconfig.nvim'},
        { 'folke/neodev.nvim' },
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        -- Snippets
        { 'L3MON4D3/LuaSnip',
          dependencies = { 'rafamadriz/friendly-snippets' }},
        { 'rafamadriz/friendly-snippets' },
        { 'molleweide/LuaSnip-snippets.nvim' },
        { 'saadparwaiz1/cmp_luasnip' },
        --Debugging
        { 'simrat39/rust-tools.nvim' },
    },

    config = function()
        local lsp_zero = require('lsp-zero')
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()
        local luasnip = require('luasnip')
        local neodev = require('neodev')

        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup({
            region_check_events = "CursorMoved",
            delete_check_events = "TextChanged",
        })

        lsp_zero.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp_zero.default_keymaps({buffer = bufnr})
        end)
        require('mason').setup({})
        require('mason-lspconfig').setup({
          ensure_installed = {
            'pyright',
            --'rust_analyzer',
            'clangd',
          },
          handlers = {
            lsp_zero.default_setup,
          },
        })

        cmp.setup({
          snippet = {
            expand = function (args)
                luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            -- `Enter` key to confirm completion
            ['<CR>'] = cmp.mapping.confirm({select = false}),

            -- Ctrl+Space to trigger completion menu
            ['<C-Space>'] = cmp.mapping.complete(),
           -- Scroll up and down in the completion documentation
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
          }),
          source = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          }
        })

        neodev.setup()
    end,
}
