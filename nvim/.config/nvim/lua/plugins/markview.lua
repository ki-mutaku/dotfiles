return {
	"OXY2DEV/markview.nvim",
	branch = "main",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>mv", "<cmd>Markview toggle<cr>", desc = "Toggle Markview preview" },
	},
	opts = {
		preview = {
			enable = true,
		},
	},
}
