return {
  -- TODO: See if these are covered by extras, add as dependency
  { "nvim-neotest/neotest-jest" },
  { "jfpedroza/neotest-elixir" },
  { "nvim-neotest/neotest-python" },
  -- TODO: Remove since it is handled by extras, redefine as dependency of neotest
  { "olimorris/neotest-rspec" },
  {
    "nvim-neotest/neotest",
    config = function(_, opts)
      vim.list_extend(opts.adapters, {
        -- Javascript
        require("neotest-jest"),
        -- Elixir
        require("neotest-elixir"),
        -- Python
        require("neotest-python"),
        -- Ruby
        require("neotest-rspec"),
      })
      require("neotest").setup(opts)
    end,
  },
}
