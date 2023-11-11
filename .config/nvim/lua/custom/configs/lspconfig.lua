local configs = require("plugins.configs.lspconfig")
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
    on_attach = configs.on_attach,
    capabilities = configs.capabilities,
  }
end

lspconfig["elixirls"].setup {
  cmd = {
    "elixir-ls"
  },
}
