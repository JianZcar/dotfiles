local nvchad_blink = require("nvchad.blink.config")
local blink = {
  cmdline = {
    enabled = false,
  },
  keymap = {
    preset = "default", -- uses sensible defaults
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    ["<CR>"] = { "accept", "fallback" }
  },
  completion = {
    accept = { auto_brackets = { enabled = true } },
    documentation = {
      auto_show = true,
    },
    menu = {
      draw = {
        components = {
          label = {
            text = function(ctx)
              return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
              return require("colorful-menu").blink_components_highlight(ctx)
            end,
          },
        },
      },
    },
    list = { selection = { preselect = false } },
  },
}

autopairs = {
  check_ts = true, -- enable treesitter integration
  fast_wrap = {},
}

for k, v in pairs(nvchad_blink) do
  if blink[k] == nil then
    blink[k] = v
  end
end

require("colorful-menu").setup()
require("blink.cmp").setup(blink)
require("nvim-autopairs").setup(autopairs)
