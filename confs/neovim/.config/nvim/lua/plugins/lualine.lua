return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options.component_separators = ""
    opts.options.section_separators = { left = "", right = "" }

    -- Remove clock
    opts.sections.lualine_z = {}

    -- Remove diagnostics from lualine_c
    if opts.sections.lualine_c then
      local new_lualine_c = {}
      for _, component in ipairs(opts.sections.lualine_c) do
        if not (type(component) == "table" and component[1] == "diagnostics") then
          table.insert(new_lualine_c, component)
        end
      end
      opts.sections.lualine_c = new_lualine_c
    end

    -- Move diagnostics to right side
    local icons = LazyVim.config.icons
    opts.sections.lualine_y = {
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
    }

    opts.sections.lualine_x = {
      -- DAP
      Snacks.profiler.status(),
      {
        function()
          return "  " .. require("dap").status()
        end,
        cond = function()
          return package.loaded["dap"] and require("dap").status() ~= ""
        end,
        color = function()
          return { fg = Snacks.util.color("Debug") }
        end,
      },
      -- LazyVim
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = function()
          return { fg = Snacks.util.color("Special") }
        end,
      },
      -- Git
      { "diff" },
    }
  end,
}
