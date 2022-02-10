require('Comment').setup({
  -- this is to enable JoosepAlviste/nvim-ts-context-commentstring
  -- to allow comments in embedded languages (i.e. css in js)
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
