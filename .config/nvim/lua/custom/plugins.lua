return {
  {
    "NvChad/nvterm",
    enabled = false
  },
  {
    "folke/which-key.nvim",
    enabled = false
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      names = false,
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "┃",
      context_char = "┃",
      show_current_context_start = false,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "elixir",
        "fish",
        "haskell",
        "html",
        "css",
        "javascript",
        "java",
        "json",
        "lua",
        "ocaml",
        "python",
        -- "rust",
        "yaml",
      }
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "┃" }, -- │
        change = { text = "┃" }, -- 
        delete = { text = "┃" }, -- 󰍵
        topdelete = { text = "┃" },
        changedelete = { text = "┃" },
        untracked = { text = "┇" },
      }
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "hls",
        "rust-analyzer",
        "elixirls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
