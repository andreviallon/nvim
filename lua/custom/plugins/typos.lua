return {
  'poljar/typos.nvim',
  event = 'VeryLazy',
  config = function()
    require('typos').setup()
  end,
}
