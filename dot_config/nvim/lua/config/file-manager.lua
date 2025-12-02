local config = {
  delete_to_trash = true,
  watch_for_changes = true,
  keymaps = {
    ["<Esc>"] = "actions.close",         -- Escape closes the float
    ["<C-v>"] = "actions.select_vsplit", -- Open in vertical split
    ["<C-x>"] = "actions.select_split",  -- Open in horizontal split
  },
  view_options = {
    show_hidden = true,
  },
  confirmation = {
    border = "single",
    width = 40,
    max_width = 40,
    min_width = 40,
    win_options = {
      winhighlight = "FloatBorder:TelescopeBorder",
    },
  },
}

require("oil").setup(config)
