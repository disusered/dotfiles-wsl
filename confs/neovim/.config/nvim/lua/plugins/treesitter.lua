return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "cpp",
        "cmake",
        "css",
        "graphql",
        "latex",
        "make",
        "scss",
        "toml",
        "vue",
        "yaml",
        "astro",
        "sql",
        "rust",
        "ruby",
        "c_sharp",
        "json",
        "jsonc",
        "gitcommit",
        "git_rebase",
        "swift",
        "terraform",
      })
    end,
  },
}
