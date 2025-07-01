return {
	{
		"LunarVim/bigfile.nvim",
	},
	{
		"yetone/avante.nvim",
		build = function()
			-- conditionally use the correct build system for the current OS
			if vim.fn.has("win32") == 1 then
				return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			else
				return "make BUILD_FROM_SOURCE=true"
			end
		end,
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			provider = "claude",
			providers = {
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-sonnet-4-20250514",
					timeout = 30000, -- Timeout in milliseconds
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 20480,
					},
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						use_absolute_path = true,
					},
				},
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		init = function()
			require("nvim-tree").setup({
				view = {
					width = vim.o.columns,
					side = "left",
					preserve_window_proportions = true,
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				hijack_netrw = true,
			})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				override = {
					fish = {
						icon = "",
						color = "#428850",
						name = "fish",
					},
				},
				default = true,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				window = {
					completion = {
						border = "rounded",
						side_padding = 1,
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					},
					documentation = {
						border = "rounded",
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					},
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
	{ "onsails/lspkind.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("core.lspconfig")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>fp", "<cmd>Telescope find_files<cr>" },
			{ "<leader>ff", "<cmd>Telescope git_files<cr>" },
			{ "<leader>fw", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>" },
		},
	},
	{
		"mg979/vim-visual-multi",
		lazy = false,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"html-lsp",
				"tailwindcss-language-server",
				"css-lsp",
				"typescript-language-server",
				"prettier",
				"clang-format",
				"pyright",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPost", -- ensures it loads early enough
		build = ":TSUpdate",
		init = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"vim",
					"lua",
					"vimdoc",
					"html",
					"css",
					"javascript",
					"typescript",
					"c",
					"cpp",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("core.conform")
		end,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
