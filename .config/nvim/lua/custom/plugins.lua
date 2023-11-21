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
      -- char = "┃",
      -- context_char = "┃",
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
        "pyright",
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
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        buffers = {
          initial_mode = "normal",
          mappings = {
            n = {
              ["<leader>d"] = "delete_buffer"
            }
          }
        }
      }
    }
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      local configs = require("plugins.configs.lspconfig")

      require("rust-tools").setup({
        tools = {
          -- simply disabling inlayHintProvider under `on_attach` doesnt seem to work
          inlay_hints = {
            auto = false,
          },
        },
        server = {
          standalone = true,
          capabilities = configs.capabilities,
          on_attach = function(client, bufnr)
            client.server_capabilities.signatureHelpProvider = false
            client.server_capabilities.inlayHintProvider = {
              resolveProvider = false
            }

            configs.on_attach(client, bufnr)
          end,
        },
        settings = {
          ["rust-analyzer"] = {
            cmd = { "rust-analyzer" },
            filetypes = { "rust" },
            diagnostics = {
              enable = true
            }
          }
        }
      })
    end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    after = "nvim-web-devicons",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    cmd = {
      "Barbecue"
    },
    opts = {
      theme = {
        normal = { fg = "#b4befe" },
        separator = { fg = "#6c7096" },
        ellipsis = { fg = "#6c7096" },
      }
    },
    init = function()
      require("barbecue.ui").toggle(true)
    end
  },
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   init = function()
  --     local rainbow_delimiters = require("rainbow-delimiters")
  --
  --     require("rainbow-delimiters.setup").setup {
  --       strategy = {
  --         [""] = rainbow_delimiters.strategy["global"],
  --         vim = rainbow_delimiters.strategy["local"],
  --         rust = rainbow_delimiters.strategy["local"],
  --         haskell = rainbow_delimiters.strategy["local"],
  --         elixir = rainbow_delimiters.strategy["local"],
  --       },
  --       query = {
  --         [""] = "rainbow-delimiters",
  --         lua = "rainbow-blocks",
  --       },
  --       highlight = {
  --         'RainbowDelimiterRed',
  --         'RainbowDelimiterOrange',
  --         'RainbowDelimiterYellow',
  --         'RainbowDelimiterGreen',
  --         'RainbowDelimiterCyan',
  --         'RainbowDelimiterBlue',
  --         'RainbowDelimiterViolet',
  --       },
  --       blacklist = {
  --         -- it's super slow for these languages for some reason
  --         'rust',
  --         'haskell',
  --         'elixir',
  --       },
  --     }
  --   end,
  -- }
}
