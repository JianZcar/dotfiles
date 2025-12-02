-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert mode
-- vim.keymap.set("i", ";;", "<Esc>", { desc = "Exit insert" })
-- vim.keymap.set("i", "::", "<Esc>v", { desc = "Exit insert + visual" })

-- Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- Normal: save / quit / misc
vim.keymap.set('t', ';;', [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Force quit all" })
vim.keymap.set("n", "<leader>W", ":wq<CR>", { desc = "Save & quit" })
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- Centered navigation
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Right window" })

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- Buffers
vim.keymap.set("n", "<Tab>", "<Plug>(CybuNext)", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Plug>(CybuPrev)", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bc", function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd("bprev")
  vim.api.nvim_buf_delete(bufnr, { force = true })
end, { desc = "Close buffer" })

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader><Tab>", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><S-Tab>", ":tabprevious<CR>", { desc = "Prev tab" })

-- Theme picker
vim.keymap.set("n", "<leader>ft", function()
  require("nvchad.themes").open()
end, { desc = "Pick theme" })

-- Files
vim.keymap.set("n", "<leader>e", function()
  require("oil").open(nil, { preview = { vertical = true } })
end, { desc = "Explore files" })
vim.keymap.set("n", "<leader>E", function()
  require("oil").open(vim.fn.getcwd(), { preview = { vertical = true } })
end, { desc = "Explore cwd" })

-- Telescope shortcuts
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find file" })

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>bb", function()
  require("telescope.builtin").buffers()
end, { desc = "List buffers" })

vim.keymap.set("n", "<leader>gt", function()
  require("telescope.builtin").git_status()
end, { desc = "Git status" })

-- LSP
vim.keymap.set("n", "<leader>lr", require("nvchad.lsp.renamer"), { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover doc" })

-- Formatting
local lsp_format = function()
  strip_trailing_whitespace()
  vim.lsp.buf.format({ async = true })
end
vim.keymap.set("n", "<leader>lf", lsp_format, { desc = "Format buffer" })
vim.keymap.set("v", "<leader>lf", lsp_format, { desc = "Format selection" })

-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle diagnostics" })
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })

-- Treesitter
-- Treesitter Textobjects
vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "Function outer" })

vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "Function inner" })

vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "Class outer" })

vim.keymap.set({ "x", "o" }, "ic", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "Class inner" })

vim.keymap.set("n", "<leader>a", function()
  require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
end, { desc = "Swap next param" })

vim.keymap.set("n", "<leader>A", function()
  require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
end, { desc = "Swap prev param" })
