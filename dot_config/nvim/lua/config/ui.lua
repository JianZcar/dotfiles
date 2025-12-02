require("gitsigns").setup({
  current_line_blame = true,
})

local indent = {
  scope = {
    enabled = true,                      -- enable scope guides
    show_start = true,                   -- underline start of scope
    show_end = false,                    -- underline end of scope
    injected_languages = true,           -- support TS injected langs
    highlight = { "Function", "Label" }, -- highlight groups for scope
  },
}

local cybu = {
  style = {
    path = "relative", -- absolute, relative, tail (filename only),
    -- tail_dir (filename & parent dir)
    path_abbreviation = "none", -- none, shortened
    border = "single", -- single, double, rounded, none
    separator = " ", -- string used as separator
    prefix = "…", -- string used as prefix for truncated paths
    padding = 1, -- left & right padding in number of spaces
    hide_buffer_id = true, -- hide buffer IDs in window
    devicons = {
      enabled = true, -- enable or disable web dev icons
      colored = true, -- enable color for web dev icons
      truncate = true, -- truncate wide icons to one char width
    },
    highlights = { -- see highlights via :highlight
      current_buffer = "TelescopeSelection", -- selected buffer
      adjacent_buffers = "TelescopeNormal", -- other buffers
      background = "TelescopeNormal", -- background
      border = "TelescopeBorder", -- border              -- border of the window
    },
  }
}

require("markview").setup({
  experimental = {
    check_rtp_message = false
  }
});

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function delete_selected(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if vim.tbl_isempty(multi) then
    local s = action_state.get_selected_entry()
    vim.api.nvim_buf_delete(s.bufnr, { force = true })
  else
    for _, e in ipairs(multi) do vim.api.nvim_buf_delete(e.bufnr, { force = true }) end
  end
  actions.close(prompt_bufnr)
end

local telescope = {
  defaults = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      width = 70,
      height = 35,
      prompt_position = "top",
    },
  },
  pickers = {
    find_files = {
      hidden = true
    },
    buffers = {
      attach_mappings = function(prompt_bufnr, map)
        map("i", "<C-d>", function() delete_selected(prompt_bufnr) end)
        map("n", "<C-d>", function() delete_selected(prompt_bufnr) end)
        return true
      end,
    },
  },
  extensions = {
    ["ui-select"] = {
    }
  }
}

local fidget = {
  notification = { override_vim_notify = true }
}

require("base46").load_all_highlights()
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
require("nvchad")

require("cybu").setup(cybu)
require("fidget").setup(fidget)
require("ibl").setup(indent)
require("telescope").setup(telescope)
require("telescope").load_extension("ui-select")
