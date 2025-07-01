local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(client, bufnr)
	print(client.name .. " attached")
end
local on_init = function(client, _)
	print(client.name .. " initialized")
end

local servers = { "html", "cssls", "tailwindcss" }

-- lsps with default
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		local cp = client.server_capabilities.completionProvider
		local tds = client.server_capabilities.textDocumentSync
		local def = client.server_capabilities.definitionProvider
		local dec = client.server_capabilities.declarationProvider
		local hover = client.server_capabilities.hoverProvider
		client.server_capabilities = {
			completionProvider = cp,
			textDocumentSync = tds,
			definitionProvider = def,
			declarationProvider = dec,
			hoverProvider = hover,
		}
		client.handlers["textDocument/publishDiagnostics"] = function() end
		on_attach(client, bufnr)
	end,
	on_init = on_init,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	settings = {
		python = {
			pythonPath = "/usr/local/anaconda3/envs/sam2_env/bin/python",
			analysis = {
				extraPaths = { "/Users/npw/Documents/proj/quick-ones/sam2/sam2" },
			},
		},
	},
})
lspconfig.ts_ls.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	settings = {
		typescript = {
			format = {
				indentSize = 2,
				tabSize = 2,
			},
		},
		javascript = {
			format = {
				indentSize = 2, -- Also apply to JavaScript files
				tabSize = 2,
			},
		},
	},
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
		},
	},
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
			},
			completion = true,
			validate = true,
			hover = true,
			customTags = { "!include scalar", "!include sequence" },
			format = {
				enable = true,
			},
			schemas = {},
		},
	},
})

local handlers = vim.lsp.handlers
handlers["textDocument/hover"] = vim.lsp.with(handlers.hover, { border = "rounded" })
handlers["textDocument/signatureHelp"] = vim.lsp.with(handlers.signature_help, { border = "rounded" })

vim.diagnostic.config({ float = { border = "rounded" }, signs = false })
