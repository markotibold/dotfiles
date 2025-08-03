return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ensure_installed = { "codelldb" },
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({

				capabilities = capabilities,
				cmd = { "clangd" },

				filetypes = { "c", "cpp" },
			})
			-- arduino-language-server does not work properly with nvim10+, workaround in url
			-- https://github.com/arduino/arduino-language-server/pull/199
			lspconfig.arduino_language_server.setup({
				capabilities = capabilities,
				cmd = {
					"arduino-language-server",
					"-clangd",
					"/usr/bin/clangd",
					"-cli",
					"/usr/local/bin/arduino-cli",
					"-cli-config",
					"Users/marko/Library/Arduino15/arduino-cli.yaml",
					"-fqbn",
					"arduino:avr:nano",
				},
				filetypes = { "arduino", "ino" },
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
