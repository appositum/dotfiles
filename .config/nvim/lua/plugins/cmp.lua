local Plugin = {'hrsh7th/nvim-cmp'}

Plugin.dependencies = {
  -- Sources
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'saadparwaiz1/cmp_luasnip'},
  {'hrsh7th/cmp-nvim-lsp'},

  -- Snippets
  {'L3MON4D3/LuaSnip'},
  {'rafamadriz/friendly-snippets'},
}

Plugin.event = 'InsertEnter'

function Plugin.config()
  vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

  local cmp = require('cmp')
  local luasnip = require('luasnip')
  require('luasnip.loaders.from_vscode').lazy_load()

  local select_opts = {behavior = cmp.SelectBehavior.Select}

  -- See :help cmp-config
  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    sources = {
      {name = 'path'},
      {name = 'nvim_lsp'},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    -- See :help cmp-mapping
    mapping = {
      ['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-j>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),

      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({select = true}),
      ['<S-Tab>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.replace,
        select = true,
      }),
    },
  })
end

return Plugin
