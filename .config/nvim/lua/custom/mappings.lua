local M = {}

M.general = {
  n = {
    -- Shortcuts
    ["<leader>a"] = { ":keepjumps normal! ggVG<cr>", " idk"},
    ["<leader>o"] = { "o<Esc>", "Insert bottom newline in normal mode"},
    ["<leader>O"] = { "O<Esc>", "Insert top newline in normal mode" },
    ["<leader>s"] = { "i<Space><Esc>", "Insert whitespace in normal mode"},

    -- Basic clipboard interaction
    -- vim.keymap.set({"n" = { "x"} = { "gy" = { ""+y") -- copy
    -- vim.keymap.set({"n" = { "x"} = { "gp" = { ""+p") -- paste

    -- -- Delete text
    ["x"] = { '"_x', "Delete without copying"},

    -- Commands
    ["<leader>w"] = { "<cmd>write<cr>", "Save file"},
    ["<leader>bq"] = { "<cmd>bdelete<cr>", "kill buffer"},
    ["<leader>bl"] = { "<cmd>buffer #<cr>", " idk lol"},

    -- ["<leader>t"] = { "<cmd>NvimTreeToggle<cr>" },

    ["<leader>?"] = { "<cmd>Telescope help_tags<cr>", "Telescope help tags" },
    ["<leader><space>"] = { "<cmd>Telescope buffers initial_mode=normal<cr>", "Telescope buffers" },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
    ["<leader>fd"] = { "<cmd>Telescope diagnostics<cr>", "Telescope diagnostics"},
    ["<leader>fb"] = { "<cmd>Telescope buffers initial_mode=normal<cr>", "Telescope buffers"},
    ["<leader>fs"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Telescope current file"},
  }
}

return M
