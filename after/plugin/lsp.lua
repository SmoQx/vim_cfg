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
    --'clangd',
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
