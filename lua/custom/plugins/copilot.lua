return {
  { 'github/copilot.vim' },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    config = function()
      require('copilot_cmp').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
}
