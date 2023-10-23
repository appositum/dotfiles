return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- "elixirls",
        "hls",
        "rust_analyzer",
      },

      -- auto-install configured servers (with lspconfig)
      automatic_installation = { exclude = "ocamllsp" }, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- "prettier", -- prettier formatter
        -- "stylua", -- lua formatter
      },
    })
  end,
}
