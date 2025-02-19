return {
  'github/copilot.vim',
  dependencies = { 'catppuccin/nvim' },
  event = 'VimEnter',
  lazy = true,

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
  },
}
