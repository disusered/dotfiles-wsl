return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false },
    indent = { -- replaced indent-blankline.nvim
      enabled = true,
      only_scope = true,
    },
    input = { enabled = true }, -- replaced dressing.nvim
    notifier = { enabled = true }, -- replaced nvim-notify
    scope = { enabled = true }, -- ii/ai objects for scope
    scroll = { enabled = false }, -- no smooth scrolling
    statuscolumn = { enabled = false }, -- we set this in options.lua
    words = { enabled = true },
    bigfile = { notify = true },
    terminal = { enabled = false }, -- do not use snacks terminal
    browse = { handler = "wslview" },
  },
  keys = {
    {
      "<leader>q",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
  },
}
