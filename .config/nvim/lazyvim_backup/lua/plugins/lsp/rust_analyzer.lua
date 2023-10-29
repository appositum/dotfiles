local nvim_lsp = require'lspconfig'

local on_attach = function(client)
  require'completion'.on_attach(client)
end

nvim_lsp.rust_analyzer.setup({
  on_attach=on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  }
})
