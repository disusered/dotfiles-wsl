return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    cmd = "MCPHub", -- lazy load by default
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    use_bundled_binary = true,
    auto_approve = true, -- Automatically approve the call of the MCP server
    opts = {
      extensions = {
        codecompanion = {
          -- Show the mcp tool result in the chat buffer
          show_result_in_chat = true,
          -- Make chat #variables from MCP server resources
          make_vars = true,
          -- Create slash commands for prompts
          make_slash_commands = true,
        },
      },
    },
    keys = {
      { "<leader>ah", "<cmd>MCPHub<CR>", desc = "Code Companion" },
    },
  },
}
