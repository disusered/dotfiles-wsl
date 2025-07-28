local actions = require("fzf-lua").actions

return {
  "ibhagwan/fzf-lua",

  opts = {
    actions = {
      -- Below are the default actions, setting any value in these tables will override
      -- the defaults, to inherit from the defaults change [1] from `false` to `true`
      files = {
        -- true,        -- uncomment to inherit all the below in your custom config
        -- Pickers inheriting these actions:
        --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
        --   tags, btags, args, buffers, tabs, lines, blines
        -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
        -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
        -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
        ["enter"] = actions.file_edit_or_qf,
        ["ctrl-s"] = actions.file_split,
        ["ctrl-v"] = actions.file_vsplit,
        ["ctrl-t"] = actions.file_tabedit,
        ["ctrl-q"] = actions.file_sel_to_qf,
        ["alt-Q"] = actions.file_sel_to_ll,
        ["alt-i"] = actions.toggle_ignore,
        ["alt-h"] = actions.toggle_hidden,
        ["alt-f"] = actions.toggle_follow,
      },
    },
  },
  keys = {
    {
      -- keymap to grep for grepping the name under the cursor
      "!",
      function()
        -- FIXME: Show hidden files but not gitignored files
        return require("fzf-lua").grep_cword({ hidden = false })
      end,
      mode = { "n", "x" },
      desc = "Find in files",
    },
  },
}
