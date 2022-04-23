local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()

cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'luasnip' },
    { name = 'buffer', keyword_length = 4 },
  }),

  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<c-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<C-u>'] = cmp.mapping.complete(),
  },

  snippet = {
    expand = function(args) 
      require('luasnip').lsp_expand(args.body)
    end
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        path = '[path]',
        luasnip = '[snip]',
      },
    }
  }
})
