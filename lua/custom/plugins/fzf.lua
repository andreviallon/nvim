return {
  'ibhagwan/fzf-lua',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local fzf = require 'fzf-lua'
    fzf.setup {}

    vim.keymap.set('n', '<leader>fh', function()
      fzf.help_tags()
    end, { desc = 'Help' })
    vim.keymap.set('n', '<leader>fk', function()
      fzf.keymaps()
    end, { desc = 'Keymaps' })
    vim.keymap.set('n', '<leader>ff', function()
      fzf.files()
    end, { desc = 'File' })
    vim.keymap.set('n', '<leader><leader>', function()
      fzf.files()
    end, { desc = 'Find file' })
    vim.keymap.set('n', '<leader>fg', function()
      fzf.git_files()
    end, { desc = 'File (git)' })
    vim.keymap.set('n', '<leader>fw', function()
      fzf.grep_cword()
    end, { desc = 'Search word current file' })
    vim.keymap.set('n', '<leader>fW', function()
      fzf.live_grep()
    end, { desc = 'Search word (live grep)' })
    vim.keymap.set('n', '<leader>/', function()
      fzf.live_grep()
    end, { desc = 'Search word' })
    vim.keymap.set('n', '<leader>fd', function()
      fzf.lsp_diagnostics()
    end, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<leader>fR', function()
      fzf.resume()
    end, { desc = 'Resume search' })
    vim.keymap.set('n', '<leader>fr', function()
      fzf.oldfiles()
    end, { desc = 'Recent files' })
    vim.keymap.set('n', '<leader>fb', function()
      fzf.buffers()
    end, { desc = 'Buffer' })
    vim.keymap.set('n', '<leader>f/', function()
      fzf.live_grep { grep_open_files = true, prompt_title = 'Search in open files (live grep)' }
    end, { desc = 'Search in Open Files (live grep)' })
    vim.keymap.set('n', '<leader>fn', function()
      fzf.files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Neovim files' })
  end,
}
