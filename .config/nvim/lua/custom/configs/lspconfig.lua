local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = {
  "html",
  "cssls",
  "clangd",
  "hls",
  "rust_analyzer",
  "elixirls",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["elixirls"].setup {
  cmd = {
    "elixir-ls"
  },
}

lspconfig["rust_analyzer"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      cmd = {
        "rust-analyzer",
      },
      filetypes = {
        "rust"
      },
      diagnostics = {
        enable = true;
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
    }
  }
}
