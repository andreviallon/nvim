return {
  'ibhagwan/fzf-lua',
  event = 'VimEnter',
  lazy = true,
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
    end, { desc = 'Files' })
    vim.keymap.set('n', '<leader><leader>', function()
      fzf.files()
    end, { desc = 'Find file' })
    vim.keymap.set('n', '<leader>fd', function()
      local fzf = require 'fzf-lua'
      fzf.fzf_exec('fd --type d --hidden --exclude .git', {
        prompt = 'Select Directory: ',
        cwd = vim.fn.getcwd(),
        actions = {
          ['default'] = function(selected)
            local dir = selected[1]
            if dir and dir ~= '' then
              fzf.live_grep { cwd = dir }
            end
          end,
        },
      })
    end, { desc = 'Grep in directory' })
    vim.keymap.set('n', '<leader>fg', function()
      fzf.git_files()
    end, { desc = 'File (git)' })
    vim.keymap.set('n', '<leader>fw', function()
      fzf.grep_cword()
    end, { desc = 'Search word current file' })
    vim.keymap.set('n', '<leader>/', function()
      fzf.live_grep()
    end, { desc = 'Search word' })
    vim.keymap.set('n', '<leader>fD', function()
      fzf.lsp_diagnostics()
    end, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<leader>fR', function()
      fzf.resume()
    end, { desc = 'Resume search' })
    vim.keymap.set('n', '<leader>fr', function()
      fzf.oldfiles()
    end, { desc = 'Recent files' })
    vim.keymap.set('n', '<leader>.', function()
      fzf.buffers()
    end, { desc = 'Buffer' })
    vim.keymap.set('n', '<leader>.', function()
      fzf.buffers()
    end, { desc = 'Buffer' })
    vim.keymap.set('n', '<leader>bb', function()
      fzf.buffers()
    end, { desc = 'Buffer' })
    vim.keymap.set('n', '<leader>f/', function()
      fzf.live_grep { grep_open_files = true, prompt_title = 'Search in open files (live grep)' }
    end, { desc = 'Search in Open Files (live grep)' })
    vim.keymap.set('n', '<leader>ft', function()
      local filetype = vim.fn.input 'Enter file extension:'
      if filetype ~= '' then
        fzf.grep { glob = '**/*.' .. filetype }
      end
    end, { desc = 'Search by File Type' })

    vim.keymap.set('n', '<leader>nn', function()
      fzf.messages()
    end, { desc = 'Notification History' })

    vim.keymap.set('n', '<leader>fc', function()
      fzf.files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Find Config File' })

    vim.keymap.set('n', '<leader>fp', function()
      fzf.projects()
    end, { desc = 'Projects' })

    vim.keymap.set('n', '<leader>fs', function()
      fzf.lsp_live_workspace_symbols()
    end, { desc = 'LSP Symbols' })

    vim.keymap.set('n', '<leader>fS', function()
      fzf.lsp_workspace_symbols()
    end, { desc = 'LSP Workspace Symbols' })

    vim.keymap.set('n', '<leader>dd', function()
      fzf.diagnostics_document()
    end, { desc = 'Diagnostics' })

    -- Git
    vim.keymap.set('n', '<leader>gB', function()
      fzf.git_branches()
    end, { desc = 'Git Branches' })
    vim.keymap.set('n', '<leader>gl', function()
      fzf.git_commits()
    end, { desc = 'Git Log' })
    vim.keymap.set('n', '<leader>gL', function()
      fzf.git_bcommits()
    end, { desc = 'Git Log Line' })
    vim.keymap.set('n', '<leader>gs', function()
      fzf.git_status()
    end, { desc = 'Git Status' })
    vim.keymap.set('n', '<leader>gS', function()
      fzf.git_stash()
    end, { desc = 'Git Stash' })
    vim.keymap.set('n', '<leader>gD', function()
      fzf.git_diff()
    end, { desc = 'Git Diff (Hunks)' })
    vim.keymap.set('n', '<leader>gf', function()
      fzf.git_bcommits()
    end, { desc = 'Git Log File' })

    -- LSP
    vim.keymap.set('n', 'gd', function()
      fzf.lsp_definitions()
    end, { desc = 'Goto Definition' })
    vim.keymap.set('n', 'gD', function()
      fzf.lsp_declarations()
    end, { desc = 'Goto Declaration' })
    vim.keymap.set('n', 'gr', function()
      fzf.lsp_references()
    end, { nowait = true, desc = 'References' })
    vim.keymap.set('n', 'gi', function()
      fzf.lsp_implementations()
    end, { desc = 'Goto Implementation' })
    vim.keymap.set('n', 'gt', function()
      fzf.lsp_typedefs()
    end, { desc = 'Goto Type Definition' })

    -- UI
    vim.keymap.set('n', '<leader>uc', function()
      fzf.colorschemes()
    end, { desc = 'Colorschemes' })
  end,
}
