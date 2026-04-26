return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- 新しいAPI (Neovim 0.11+) を使用して共通のcapabilitiesを設定
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- 各種サーバーの設定 (必要に応じて追加)
		local servers = { "pyright", "ts_ls", "lua_ls" }

		for _, lsp in ipairs(servers) do
			vim.lsp.enable(lsp)
		end

		-- LSPがアタッチされたときのみ有効になるキーバインド
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				-- gd: 定義ジャンプ (Go to Definition)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				-- K: ホバー表示 (ドキュメント確認)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				-- gi: 実装ジャンプ (Go to Implementation)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				-- gr: 参照一覧 (Go to References)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				-- <leader>rn: リネーム
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end,
		})
	end,
}
