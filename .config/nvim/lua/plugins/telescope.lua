return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require('telescope').setup({
      pickers = {
        buffers = {
          initial_mode = "normal"
        },
        find_files = {
          initial_mode = "insert"
        },
      }
    })
  end
}
