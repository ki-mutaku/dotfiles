return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"pyright", -- Python
			"ts_ls", -- TypeScript / JavaScript
			"lua_ls", -- Lua
		},
		automatic_installation = true,
	},
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "williamboman/mason.nvim", opts = {} },
	},
}
