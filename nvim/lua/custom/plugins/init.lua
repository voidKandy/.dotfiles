require("custom.keymaps")
require("custom.options")

return {
	require("custom.plugins.configs.oil"),
	require("custom.plugins.configs.marks"),
	require("custom.plugins.configs.telescope"),
	require("custom.plugins.configs.lsp"),
	require("custom.plugins.configs.harpoon"),
	require("custom.plugins.configs.obsidian"),
	require("custom.plugins.configs.trouble"),
	require("custom.plugins.configs.diff_view"),
	require("custom.plugins.configs.snacks"),
	"mbbill/undotree",
}
