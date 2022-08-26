-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

-- lspkind provides icons on the completion panel
local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
  return
end

lspkind.init()

cmp.setup({
  -- load snippet support
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'luasnip' },
    { name = 'buffer', keyword_length = 4 },
  }),

  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-u>'] = cmp.mapping.complete(),
  },


  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text',
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        path = '[path]',
        luasnip = '[snip]',
      },
    }
  }
})
