-- https://github.com/fredrikaverpil/dotfiles/blob/main/nvim-lazyvim/lua/plugins/lsp.lua
return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    local linters = require("lint").linters

    -- Lint sql files with sqlfluff
    opts.linters_by_ft = opts.linters_by_ft or {}
    opts.linters_by_ft["sql"] = opts.linters_by_ft["sql"] or {}
    table.insert(opts.linters_by_ft["sql"], "sqlfluff")

    -- Lint makefiles with checkmake
    opts.linters_by_ft["make"] = opts.linters_by_ft["make"] or {}
    table.insert(opts.linters_by_ft["make"], "checkmake")

    -- Lint Python files with flake8
    opts.linters_by_ft["python"] = opts.linters_by_ft["python"] or {}
    table.insert(opts.linters_by_ft["python"], "flake8")
  end,
}
