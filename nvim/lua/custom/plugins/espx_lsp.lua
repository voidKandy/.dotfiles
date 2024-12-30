local lsp_config = require("lspconfig")
local configs = require("lspconfig.configs")

if not configs.espx_ls then
	configs.espx_ls = {
		default_config = {
			name = "espx_ls",
			autostart = true,
			cmd = { "espx-ls" },
			filetypes = { "rust" },
			root_dir = function()
				-- this markerfile should be put in the root directory of any project you want to use with this LSP
				return vim.fs.dirname(vim.fs.find({ ".espx" }, { upward = true })[1])
			end,
		},
	}
end

lsp_config.espx_ls.setup({})

return {}
