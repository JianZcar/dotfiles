require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = "v", -- charwise
      ['@function.outer'] = "V",  -- linewise
      ['@class.outer'] = "<c-v>", -- blockwise
    },
    include_surrounding_whitespace = false,
  },
}
-- As a substitute to treesitter incremental
require('incr').setup({
  incr_key = "<C-Space>", -- Ctrl+Space (or Ctrl + whatever you like)
  decr_key = "<BS>",      -- Ctrl+Shift+Space
})
