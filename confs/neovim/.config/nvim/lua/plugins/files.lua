return {
  "echasnovski/mini.files",
  keys = {
    {
      "-",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open file explorer",
    },
  },
  opts = {
    windows = {
      preview = true,
      width_focus = 30,
      width_preview = 80,
    },
    options = {
      -- Whether to use for editing directories
      -- Disabled by default in LazyVim because neo-tree is used for that
      use_as_default_explorer = true,
    },
  },
}
