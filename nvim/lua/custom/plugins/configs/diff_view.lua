return {
	-- https://github.com/sindrets/diffview.nvim
	"sindrets/diffview.nvim",
	config = function()
		local diffview = require("diffview")
		diffview.setup({})
		vim.keymap.set("n", "<leader>vf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diff view current file" })
		vim.keymap.set("n", "<leader>vb", "<cmd>DiffviewFileHistory<CR>", { desc = "Diff view current branch" })
		vim.keymap.set("n", "<leader>vb", "<cmd>DiffviewOpen HEAD~2 -- <CR>", { desc = "Diff view current head" })
	end,
}
