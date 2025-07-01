local options = {
	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },

		c = { "clang-format" },
		cpp = { "clang-format" },
		sh = { "shfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters = {
		prettier = {
			prepend_args = { "--print-width", "120", "--timeout_ms", "3000" },
		},
		clang_format = {
			prepend_args = { "--style=file" },
		},
	},
}

require("conform").setup(options)
