-- [[ Gloval Variables ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.virtualedit = 'block'
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 15
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- [[ Spell Check ]]
vim.opt.spell = true
vim.opt.spelllang = 'en'
vim.opt.spelloptions = 'camel'
vim.opt.spellfile = vim.fn.expand '~/.config/nvim/spell/custom.utf-8.add'

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'markdown' },
  callback = function()
    vim.opt.spell = true
    vim.opt.spelloptions = 'camel'
  end,
})

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Lazy
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })
vim.keymap.set('n', '<leader>:', 'q:', { desc = 'Command history' })

-- Buffer
vim.keymap.set('n', '<leader>b1', ':lua require("bufferline").go_to_buffer(1, true)<CR>', { silent = true, desc = 'Goto buffer 1' })
vim.keymap.set('n', '<leader>b2', ':lua require("bufferline").go_to_buffer(2, true)<CR>', { silent = true, desc = 'Goto buffer 2' })
vim.keymap.set('n', '<leader>b3', ':lua require("bufferline").go_to_buffer(3, true)<CR>', { silent = true, desc = 'Goto buffer 3' })
vim.keymap.set('n', '<leader>b4', ':lua require("bufferline").go_to_buffer(4, true)<CR>', { silent = true, desc = 'Goto buffer 4' })
vim.keymap.set('n', '<leader>b5', ':lua require("bufferline").go_to_buffer(5, true)<CR>', { silent = true, desc = 'Goto buffer 5' })
vim.keymap.set('n', '<leader>b6', ':lua require("bufferline").go_to_buffer(6, true)<CR>', { silent = true, desc = 'Goto buffer 6' })
vim.keymap.set('n', '<leader>b7', ':lua require("bufferline").go_to_buffer(7, true)<CR>', { silent = true, desc = 'Goto buffer 7' })
vim.keymap.set('n', '<leader>b8', ':lua require("bufferline").go_to_buffer(8, true)<CR>', { silent = true, desc = 'Goto buffer 8' })
vim.keymap.set('n', '<leader>b9', ':lua require("bufferline").go_to_buffer(9, true)<CR>', { silent = true, desc = 'Goto buffer 9' })
vim.keymap.set('n', '<leader>b$', ':lua require("bufferline").go_to_buffer($, true)<CR>', { silent = true, desc = 'Goto last buffer' })
vim.keymap.set('n', '<leader>bd', ':bp|bd #<CR>', { noremap = true, desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bD', ':bw! #<CR>', { noremap = true, desc = 'Delete buffer force' })

-- Diagnostics
vim.keymap.set('n', '<leader>ux', vim.diagnostic.setloclist, { desc = 'Toggle diagnostic quickfix list' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Open diagnostic error message' })
vim.keymap.set('n', '<leader>ud', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

-- Move lines up and down
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==')
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")

-- Window
vim.keymap.set('n', '<leader>ss', ':split<Return>', { desc = 'Split window below', noremap = true, silent = true })
vim.keymap.set('n', '<leader>sv', ':vsplit<Return>', { desc = 'Split window right', noremap = true, silent = true })
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', '<C-w><left>', '<C-w><')
vim.keymap.set('n', '<C-w><right>', '<C-w>>')
vim.keymap.set('n', '<C-w><up>', '<C-w>+')
vim.keymap.set('n', '<C-w><down>', '<C-w>-')

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ LazyVim ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'tpope/vim-sleuth',
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        signs = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '' },
          topdelete = { text = '' },
          changedelete = { text = '▎' },
          untracked = { text = '▎' },
        },
        signs_staged = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '' },
          topdelete = { text = '' },
          changedelete = { text = '▎' },
        },
      },
    },
  },
  install = { colorscheme = { 'catppuccin' } },
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    opts = { colorscheme = 'mocha' },
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      preset = 'helix',
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>a', group = 'AI', icon = { icon = '󰅭 ' } },
        { '<leader>c', group = 'Code', mode = { 'n', 'x' } },
        { '<leader>f', group = 'File & Search', icon = { icon = ' ' } },
        { '<leader>t', group = 'Test', icon = { icon = '󰙨 ' } },
        { '<leader>g', group = 'Git', icon = { icon = ' ' } },
        { '<leader>u', group = 'UI', icon = { icon = ' ' } },
        { '<leader>d', group = 'Diagnostics', icon = { icon = '󱖫 ' } },
        { '<leader>h', group = 'Harpoon', icon = { icon = '󰙅 ' } },
        { '<leader>:', group = 'Command History', icon = { icon = ' ' } },
        { '<leader>q', group = 'Sessions', icon = { icon = ' ' } },
        { '<leader>n', group = 'Noice', icon = { icon = '󰈸 ' } },
        {
          '<leader>b',
          icon = { icon = ' ' },
          group = 'Buffer',
          expand = function()
            return require('which-key.extras').expand.buf()
          end,
        },
        {
          '<leader>w',
          group = 'Window',
          proxy = '<c-w>',
          expand = function()
            return require('which-key.extras').expand.win()
          end,
        },
      },
    },
  },
  config = function(_, opts)
    require('neotest').setup(opts)
  end,
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require 'conform'

      conform.setup {
        formatters_by_ft = {
          javascript = { 'prettierd' },
          typescript = { 'prettierd' },
          javascriptreact = { 'prettierd' },
          typescriptreact = { 'prettierd' },
          css = { 'prettierd' },
          html = { 'prettierd' },
          json = { 'prettierd' },
          yaml = { 'prettierd' },
          markdown = { 'prettierd' },
          graphql = { 'prettierd' },
          lua = { 'stylua' },
          python = { 'isort', 'black' },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      }
      vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end, { desc = 'Format file or range' })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
    },
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = {
        'json',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'html',
        'css',
        'prisma',
        'markdown',
        'markdown_inline',
        'svelte',
        'graphql',
        'bash',
        'lua',
        'vim',
        'dockerfile',
        'gitignore',
        'query',
        'vimdoc',
        'c',
      },
      auto_install = true,
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      indent = { enable = true },
    },
  },
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns',
  { import = 'custom.plugins' },
}, {
  ui = {
    icons = {},
  },
})
