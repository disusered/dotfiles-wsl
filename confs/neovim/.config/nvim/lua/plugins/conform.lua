return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft["*"] = opts.formatters_by_ft["*"] or {}
    table.insert(opts.formatters_by_ft["*"], "trim_whitespace")
    table.insert(opts.formatters_by_ft["*"], "trim_newlines")

    opts.formatters_by_ft["sql"] = opts.formatters_by_ft["sql"] or {}
    table.insert(opts.formatters_by_ft["sql"], "sqlfluff")

    opts.formatters_by_ft["cs"] = opts.formatters_by_ft["cs"] or {}
    table.insert(opts.formatters_by_ft["cs"], "csharpier")

    opts.formatters = opts.formatters or {}
    opts.formatters["csharpier"] = function()
      local command
      if vim.fn.executable("csharpier") == 1 then
        command = "csharpier"
      elseif vim.fn.executable("dotnet") == 1 then
        command = "dotnet csharpier"
      else
        vim.notify("[conform] csharpier or dotnet not found in path", vim.log.levels.WARN)
        return
      end

      local version_out = vim.fn.system(command .. " --version")
      if vim.v.shell_error ~= 0 then
        vim.notify("[conform] csharpier not found or returned an error for command: " .. command, vim.log.levels.WARN)
        return
      end

      --NOTE: system command returns the command as the first line of the result, need to get the version number on the final line
      -- local version_result = version_out[#version_out]
      local major_version = tonumber((version_out or ""):match("^(%d+)")) or 0
      local is_new = major_version >= 1

      local args = is_new and { "format", "$FILENAME" } or { "--write-stdout" }

      return {
        command = command,
        args = args,
        stdin = not is_new,
        require_cwd = false,
      }
    end
  end,
}
