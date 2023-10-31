return {
  {
    "NvChad/nvterm",
    enabled = false
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      names = false
    }
  },
  {
    "folke/which-key.nvim",
    enabled = false
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
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
        "rust",
        "yaml",
      }
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" }, -- 
        change = { text = "│" }, -- 
        delete = { text = "│" }, -- 󰍵
        topdelete = { text = "│" },
        changedelete = { text = "│" },
        untracked = { text = "┆" },
      }
    }
  }
}
