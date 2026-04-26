return {
	-- 1. molten-nvim: 実行エンジン
	{
		"benlubas/molten-nvim",
		build = ":UpdateRemotePlugins",
		lazy = false,
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 30
			vim.g.molten_auto_open_output = false
		end,
	},

	-- 2. image.nvim: 画像表示
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty",
			integrations = {
				markdown = { enabled = true },
			},
			max_height_window_percentage = 100,
			max_width_window_percentage = 100,
			window_overlap_clear_enabled = true,
		},
	},

	-- 3. jupytext: .ipynb と .py の自動変換
	{
		"GCBallesteros/jupytext.nvim",
		config = true,
	},

	-- 4. NotebookNavigator: セル操作
	{
		"GCBallesteros/NotebookNavigator.nvim",
		keys = {
			{
				"]h",
				function()
					require("notebook-navigator").move_cell("d")
				end,
				desc = "Next cell",
			},
			{
				"[h",
				function()
					require("notebook-navigator").move_cell("u")
				end,
				desc = "Prev cell",
			},
			{
				"<leader>rc",
				function()
					require("notebook-navigator").run_cell()
				end,
				desc = "Run cell",
			},
			{
				"<leader>rm",
				function()
					require("notebook-navigator").run_and_move()
				end,
				desc = "Run and move",
			},
		},
		dependencies = {
			"echasnovski/mini.comment",
			"anuvyklack/hydra.nvim",
			-- iron.nvim は完全に削除
		},
		config = function()
			local nn = require("notebook-navigator")
			nn.setup({
				activate_hydra_keys = nil,
				-- プラグイン内蔵の molten 連携を使用する
				repl_provider = "molten",
			})
		end,
	},
}
