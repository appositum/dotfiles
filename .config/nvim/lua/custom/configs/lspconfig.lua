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
  "lua_ls"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      -- `client.server_capabilities.hoverProvider = false`
      -- hoverProvider is not an auto pop-up
      -- it's used with the `K` keymap when hovering over something

      -- disables annoying doc when typing something like `require(` or `Vec<`
      client.server_capabilities.signatureHelpProvider = false

      client.server_capabilities.inlayHintProvider = {
        resolveProvider = false
      }

      configs.on_attach(client, bufnr)
    end,
    capabilities = configs.capabilities,
  }
end

lspconfig["elixirls"].setup {
  cmd = {
    "elixir-ls"
  },
}
