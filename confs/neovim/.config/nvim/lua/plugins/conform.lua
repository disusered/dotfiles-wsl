return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft["*"] = opts.formatters_by_ft["*"] or {}
      table.insert(opts.formatters_by_ft["*"], "trim_whitespace")
      table.insert(opts.formatters_by_ft["*"], "trim_newlines")

      opts.formatters_by_ft["sql"] = { "sqlfluff" }
      opts.formatters = opts.formatters or {}
      opts.formatters["sqlfluff"] = {
        prepend_args = { "--dialect", "postgres" },
      }
    end,
  },
}
