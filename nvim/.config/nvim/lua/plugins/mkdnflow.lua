return {
	"jakewvincent/mkdnflow.nvim",
	config = function()
		require("mkdnflow").setup({
			mappings = {
				MkdnEnter = { { "i", "n", "v" }, "<CR>" },
				MkdnToggleToDo = { { "n", "v" }, "<leader>X" },
				MkdnFoldSection = { "n", "<leader>fl" },
			},
		})
	end,
}
