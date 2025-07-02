return {
  {
    "SuperBo/fugit2.nvim",
    opts = {
      libgit2_path = "/usr/lib/x86_64-linux-gnu/libgit2.so",
      rocks = {
        enabled = true,
        hererocks = true,
      },
      width = 100,
      min_width = 50,
      content_width = 60,
      max_width = "80%",
      height = "60%",
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      {
        "chrisgrieser/nvim-tinygit",
        dependencies = { "stevearc/dressing.nvim" },
      },
    },
    cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
    keys = {
      {
        "<leader>gs",
        mode = "n",
        "<cmd>Fugit2<cr>",
        desc = "Git Status",
      },
      {
        "<leader>gl",
        "<cmd>Fugit2Graph<cr>",
        desc = "Git log",
      },
    },
  },
}
