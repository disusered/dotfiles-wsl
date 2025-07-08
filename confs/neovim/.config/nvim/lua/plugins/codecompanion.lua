return {
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/mcphub.nvim",
    },

    keys = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>a", group = "ai" }, -- group
      })
      return {
        { "<leader>a", name = "ai" },
        { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Chat (CodeCompanion)" },
        { "<leader>aq", "<cmd>CodeCompanion<cr>", desc = "Quick Chat (CodeCompanion)" },
        { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Prompt Actions (CodeCompanion)" },
      }
    end,
    opts = {
      display = {
        action_palette = {
          provider = "telescope", -- Ensure action palettes use "telescope"
        },
      },
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "cmd:op.exe read op://Odasoft/Gemini\\ Api\\ Key/credential --no-newline",
            },
            schema = {
              model = {
                default = "gemini-2.5-pro",
              },
              -- ["gemini-2.5-pro"] = { opts = { can_reason = true, has_vision = true } },
              -- ["gemini-2.5-flash"] = { opts = { can_reason = true, has_vision = true } },
              -- ["gemini-2.5-flash-preview-05-20"] = { opts = { can_reason = true, has_vision = true } },
              -- ["gemini-2.0-flash"] = { opts = { has_vision = true } },
              -- ["gemini-2.0-flash-lite"] = { opts = { has_vision = true } },
              -- ["gemini-1.5-pro"] = { opts = { has_vision = true } },
              -- ["gemini-1.5-flash"] = { opts = { has_vision = true } }
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "gemini",
          tools = {
            ["mcp"] = {
              -- Prevent mcphub from loading before needed
              callback = function()
                return require("mcphub.extensions.codecompanion")
              end,
              description = "Call tools and resources from the MCP Servers",
            },
          },
          slash_commands = {
            ["buffer"] = {
              opts = {
                provider = "telescope",
              },
            },
            ["file"] = {
              opts = {
                provider = "telescope",
              },
            },
            ["help"] = {
              opts = {
                provider = "telescope",
              },
            },
            ["now"] = {
              opts = {
                provider = "telescope",
              },
            },
            ["symbols"] = {
              opts = {
                provider = "telescope",
              },
            },
            ["terminal"] = {
              opts = {
                provider = "telescope",
              },
            },
            ["workspace"] = {
              opts = {
                provider = "telescope",
              },
            },
          },
        },
        inline = {
          adapter = "copilot",
        },
        cmd = {
          adapter = "copilot",
        },
      },
    },
  },
}
