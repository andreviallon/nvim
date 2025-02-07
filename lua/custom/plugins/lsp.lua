-- return {
--   {
--     'folke/lazydev.nvim',
--     ft = 'lua',
--     opts = {
--       library = {
--         { path = 'luvit-meta/library', words = { 'vim%.uv' } },
--       },
--     },
--   },
--   { 'Bilal2453/luvit-meta', lazy = true },
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       { 'williamboman/mason.nvim', config = true, keys = { { '<leader>m', '<cmd>Mason<cr>', desc = 'Mason' } } },
--       'williamboman/mason-lspconfig.nvim',
--       'WhoIsSethDaniel/mason-tool-installer.nvim',
--       { 'j-hui/fidget.nvim', opts = {} },
--       'hrsh7th/cmp-nvim-lsp',
--     },
--     config = function()
--       vim.api.nvim_create_autocmd('LspAttach', {
--         group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
--         callback = function(event)
--           local map = function(keys, func, desc, mode)
--             mode = mode or 'n'
--             vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
--           end
--
--           vim.keymap.set('n', 'gd', function()
--             require('fzf-lua').lsp_definitions()
--           end, { desc = 'Goto definition' })
--           vim.keymap.set('n', 'gr', function()
--             require('fzf-lua').lsp_references()
--           end, { desc = 'Goto references' })
--           vim.keymap.set('n', 'gi', function()
--             require('fzf-lua').lsp_implementations()
--           end, { desc = 'Goto implementation' })
--           vim.keymap.set('n', '<leader>cd', function()
--             require('fzf-lua').lsp_typedefs()
--           end, { desc = 'Type definition' })
--           vim.keymap.set('n', '<leader>cs', function()
--             require('fzf-lua').lsp_document_symbols()
--           end, { desc = 'Document symbols' })
--           vim.keymap.set('n', '<leader>cS', function()
--             require('fzf-lua').lsp_workspace_symbols()
--           end, { desc = 'Workspace symbols' })
--
--           map('<leader>cr', vim.lsp.buf.rename, 'Rename')
--           map('<leader>ca', vim.lsp.buf.code_action, 'Code action', { 'n', 'x' })
--           map('gD', vim.lsp.buf.declaration, 'Goto declaration')
--
--           local client = vim.lsp.get_client_by_id(event.data.client_id)
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
--             local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
--             vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.document_highlight,
--             })
--
--             vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.clear_references,
--             })
--
--             vim.api.nvim_create_autocmd('LspDetach', {
--               group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
--               callback = function(event2)
--                 vim.lsp.buf.clear_references()
--                 vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
--               end,
--             })
--           end
--
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
--             map('<leader>uh', function()
--               vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
--             end, 'Toggle inlay hints')
--           end
--         end,
--       })
--
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--
--       local servers = {
--         eslint = {},
--
--         lua_ls = {
--           settings = {
--             Lua = {
--               completion = {
--                 callSnippet = 'Replace',
--               },
--             },
--           },
--         },
--       }
--
--       require('mason').setup()
--
--       local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         'stylua', -- Used to format Lua code
--       })
--       require('mason-tool-installer').setup { ensure_installed = ensure_installed }
--
--       require('mason-lspconfig').setup {
--         handlers = {
--           function(server_name)
--             local server = servers[server_name] or {}
--             server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--             require('lspconfig')[server_name].setup(server)
--           end,
--         },
--       }
--     end,
--   },
-- }
--
return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true, keys = { { '<leader>m', '<cmd>Mason<cr>', desc = 'Mason' } } },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', function()
            require('fzf-lua').lsp_definitions()
          end, 'Goto definition')
          map('gr', function()
            require('fzf-lua').lsp_references()
          end, 'Goto references')
          map('gi', function()
            require('fzf-lua').lsp_implementations()
          end, 'Goto implementation')
          map('<leader>cd', function()
            require('fzf-lua').lsp_typedefs()
          end, 'Type definition')
          map('<leader>cs', function()
            require('fzf-lua').lsp_document_symbols()
          end, 'Document symbols')
          map('<leader>cS', function()
            require('fzf-lua').lsp_workspace_symbols()
          end, 'Workspace symbols')

          map('<leader>cr', vim.lsp.buf.rename, 'Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code action', { 'n', 'x' })
          map('gD', vim.lsp.buf.declaration, 'Goto declaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>uh', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, 'Toggle inlay hints')
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        eslint = {},

        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },

        typos_lsp = {
          init_options = {
            config = vim.fn.stdpath 'config' .. '~/.config/nvim/.typos.toml', -- Path to config in Neovim folder
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
        'typos-lsp', -- Ensure typos-lsp is installed
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
