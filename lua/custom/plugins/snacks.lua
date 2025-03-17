return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bufdelete = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    git = { enabled = true },
    lazygit = { enabled = true },
    gitbrowse = { enabled = true },
    notifier = { enabled = true },
  },
  -- stylua: ignore
  keys = {
    -- Top Pickers & Explorer
    {"<leader>e", function() Snacks.explorer.open() end, desc = "Explorer" },

    -- -- Buffers
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },

    -- Git
    { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },

    -- Notifier
    { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  },
}
