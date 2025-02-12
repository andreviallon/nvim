return {
  'olimorris/codecompanion.nvim',
  event = 'VeryLazy',
  version = false, -- Keep this if you always want the latest commit
  opts = {
    strategies = {
      chat = { adapter = 'openai' },
    },
    hints = { enabled = true },
    log_level = 'INFO',
  },
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua',
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = {
          drag_and_drop = { insert_mode = true },
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = { file_types = { 'markdown', 'CodeCompanion' } },
    },
  },
  keys = {
    { '<leader>aa', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'Open CodeCompanion Actions' },
    { '<leader>at', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, desc = 'Toggle CodeCompanion Chat' },
    { '<leader>ac', '<cmd>CodeCompanionChat Add<cr>', mode = 'v', desc = 'Add selection to CodeCompanion Chat' },
  },
}
