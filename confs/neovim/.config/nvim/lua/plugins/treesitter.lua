return {
  -- Automatically insert end statements in Ruby et al
  {
    "RRethy/nvim-treesitter-endwise",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- More text objects for Treesitter
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- Languages for Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vim",
        "regex",
        "cpp",
        "lua",
        "bash",
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
        "norg",
        "html",
        "latex",
        "markdown",
        "markdown_inline",
        "typst",
        "powershell",
      })
    end,
  },
}
