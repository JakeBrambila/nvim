require("jake.core.options")
require("jake.core.keymaps")
local ok, _ = pcall(vim.cmd, 'colorscheme evening')
if not ok then
  vim.cmd 'colorscheme default' -- if the above fails, then use default
end
require("jake.plugins.nvim-tree")
require("jake.plugins.alpha")
require("jake.plugins.auto-session")
require("jake.plugins.autopairs")
require("jake.plugins.comment")
require("jake.plugins.indent-blankline")
require("jake.plugins.flutter-plugin")
require("jake.plugins.lualine")
require("jake.plugins.nvim-cmp")
require("jake.plugins.nvim-tree")
require("jake.plugins.telescope")
require("jake.plugins.todo-comments")
require("jake.plugins.treesitter")
require("jake.plugins.which-key")
require("jake.lazy")

return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
}
