return {
  { "iamcco/markdown-preview.nvim", enabled = false }, -- disable the default markdown preview plugin
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false }, -- disable the render-markdown.nvim plugin
  -- { "OXY2DEV/markview.nvim" },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        auto_load = false, -- whether to automatically load preview when entering another markdown buffer
        close_on_bdelete = true, -- close preview window on buffer delete
        syntax = true, -- enable syntax highlighting, affects performance
        theme = "light", -- 'dark' or 'light'
        update_on_change = true,
        app = "wslview", -- 'webview', 'browser', string or a table of strings
        filetype = { "markdown" }, -- list of filetypes to recognize as markdown
      })
      vim.api.nvim_create_user_command("MarkdownOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("MarkdownClose", require("peek").close, {})
    end,

    keys = function()
      local peek = require("peek")
      local wk = require("which-key")
      wk.add({
        {
          "<leader>up",
          function()
            if peek.is_open() then
              peek.close()
            else
              peek.open()
            end
          end,
          desc = function()
            return peek.is_open() and "Disable Markdown Preview" or "Enable Markdown Preview"
          end,
          icon = function()
            if peek.is_open() then
              return { icon = "", color = "green" }
            else
              return { icon = "", color = "yellow" }
            end
          end,
        },
      })
    end,
  },
}
