return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
      },

      use_default_keymaps = false,
      keymaps = {
        -- These interfere with other mappings I like more
        -- ["<C-s>"] = "actions.select_vsplit",
        -- ["<C-h>"] = "actions.select_split",
        -- ["<C-t>"] = "actions.select_tab",
        -- ["<C-l>"] = "actions.refresh",

        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },

    }
  end,
}
