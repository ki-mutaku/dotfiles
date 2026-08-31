return {
	"catppuccin/nvim",
	enabled = true,
	lazy = false,
	priority = 1000,
	opts = {
		-- 1. カラーパレットそのものを書き換える
		colors = {
			all = {
				dark5 = "#AAAAAA", -- 相対行数の基本色に使われる変数を落ち着いた灰色に固定
			},
		},
		-- 2. ハイライトの上書き設定
		on_highlights = function(hl, c)
			-- 現在行の行番号 (黄色)
			hl.CursorLineNr = {
				fg = "#E4C068",
				bold = true,
			}
			-- 相対行数 (落ち着いた灰色)
			hl.LineNr = { fg = "#AAAAAA" }
			hl.LineNrAbove = { fg = "#AAAAAA" }
			hl.LineNrBelow = { fg = "#AAAAAA" }
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
