return {
  {
    source = "nvim-treesitter/nvim-treesitter",
    depends = { "OXY2DEV/markview.nvim" },
    checkout = "main",
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  },
  {
    source = "nvim-treesitter/nvim-treesitter-textobjects",
    checkout = "main"
  },
  {
    source = "williamboman/mason.nvim",
  },
  {
    source = "daliusd/incr.nvim",
  }
}
