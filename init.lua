require("jake.core.options")
require("jake.core.keymaps")

-- Try loading colorscheme
local ok, _ = pcall(vim.cmd, "colorscheme evening")
if not ok then
	vim.cmd("colorscheme default") -- fallback to default if colorscheme fails
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
require("jake.plugins.telescope")
require("jake.plugins.todo-comments")
require("jake.plugins.treesitter")
require("jake.plugins.which-key")
require("jake.lazy")

-- Lazy.nvim setup for plugins
require("lazy").setup({
	-- DAP support
	{ "mfussenegger/nvim-dap" },

	-- Flutter tools plugin with DAP and dependencies
	{
		"akinsho/flutter-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
		config = function()
			require("flutter-tools").setup({
				-- flutter_path = "home/flutter/bin/flutter.bat", -- uncomment for Windows

				debugger = {
					enabled = false,
					run_via_dap = false,
					register_configurations = function(_)
						require("dap").adapters.dart = {
							type = "executable",
							command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
							args = { "flutter" },
						}

						require("dap").configurations.dart = {
							{
								type = "dart",
								request = "launch",
								name = "Launch flutter",
								dartSdkPath = "/home/development/flutter/bin/cache/dart-sdk/",
								flutterSdkPath = "/home/development/flutter",
								program = "${workspaceFolder}/lib/main.dart",
								cwd = "${workspaceFolder}",
							},
						}
					end,
				},

				dev_log = {
					enabled = false,
					open_cmd = "tabedit",
				},
				lsp = {
					on_attach = require("lspconfig").common_on_attach,
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				},
			})
		end,
	},

	-- Dart syntax highlighting
	{ "dart-lang/dart-vim-plugin" },

	-- Other utility plugins
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
})
