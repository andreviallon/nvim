return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_c = { { 'filename', path = 1 } }, -- path = 1 shows relative path, use 2 for absolute
      },
    }
  end,
}
