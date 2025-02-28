return {
  -- Avante
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = true,
    version = false,
    opts = {
      provider = 'openai',
      hints = { enabled = false },
    },
    build = 'make',
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
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },

  -- Codecompanion
  {
    'olimorris/codecompanion.nvim',
    event = 'VeryLazy',
    version = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'zbirenbaum/copilot.lua',
      'echasnovski/mini.diff',
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
      {
        'OXY2DEV/markview.nvim',
        lazy = false,
        opts = {
          preview = {
            filetypes = { 'markdown', 'codecompanion' },
            ignore_buftypes = {},
          },
        },
      },
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'openai',
        },
        inline = {
          keymaps = {
            accept_change = {
              modes = { n = 'ga' },
              description = 'Accept the suggested change',
            },
            reject_change = {
              modes = { n = 'gr' },
              description = 'Reject the suggested change',
            },
          },
        },
      },
      display = {
        chat = {
          show_header_separator = true,
          separator = '─',
          show_token_count = true,
          start_in_insert_mode = true,
        },
        diff = {
          enabled = true,
          close_chat_at = 240,
          layout = 'vertical',
          opts = {
            'internal',
            'filler',
            'closeoff',
            'algorithm:patience',
            'followwrap',
            'linematch:120',
          },
          provider = 'mini_diff',
        },
      },
      hints = { enabled = true },
      log_level = 'INFO',
    },
    keys = {
      {
        '<leader>za',
        '<cmd>CodeCompanionActions<cr>',
        mode = { 'n', 'v' },
        desc = 'Open CodeCompanion Actions',
      },
      {
        '<leader>zt',
        '<cmd>CodeCompanionChat Toggle<cr>',
        mode = { 'n', 'v' },
        desc = 'Toggle CodeCompanion Chat',
      },
      {
        '<leader>zc',
        '<cmd>CodeCompanionChat Add<cr>',
        mode = 'v',
        desc = 'Add selection to CodeCompanion Chat',
      },
    },
  },

  -- Copilot
  {
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
  },
}
