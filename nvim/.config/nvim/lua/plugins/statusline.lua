return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- ① 時計更新のための最適化されたタイマー処理
		local last_minute = os.date("%M")
		-- 互換性のため Neovim 0.10以上は vim.uv、それ未満は vim.loop を使用
		local uv = vim.uv or vim.loop
		local timer = uv.new_timer()

		-- 2000ms (2秒) ごとにチェック。タイマー自体は極めて軽量です
		timer:start(
			0,
			2000,
			vim.schedule_wrap(function()
				local current_minute = os.date("%M")
				-- 前回チェック時から「分」が変わった時のみ、ステータスラインを再描画
				if current_minute ~= last_minute then
					last_minute = current_minute
					vim.cmd("redrawstatus")
				end
			end)
		)

		-- ② lualine の設定
		require("lualine").setup({
			sections = {
				-- lualine_z (右端) に追加
				lualine_z = {
					"location", -- デフォルトの行・列位置表示を残す場合（不要なら削除してください）
					{
						function()
							return os.date("%H:%M")
						end,
						icon = "", -- Nerd Font の時計アイコン

						-- 色を暗めにする
						color = {
							fg = "#909090",
							bg = "2a2a2a",
						},

						padding = { left = 1, right = 1 },
					},
				},
			},
		})
	end,
}
