return {
	'stevearc/conform.nvim',
	event = 'VeryLazy',
	config = function()
		local c = require('conform')

		c.setup({
			formatters_by_ft = {
				c = { 'clang_format' },
				cpp = { 'clang_format' },

				fish = { 'fish_indent' },

				go = { 'goimports' },

				lua = { 'stylua' },

				css = { 'prettierd' },
				html = { 'prettierd' },
				javascript = { 'biome', 'prettierd' },
				javascriptreact = { 'biome', 'prettierd' },
				json = { 'biome', 'prettierd' },
				jsonc = { 'biome', 'prettierd' },
				markdown = { 'prettierd' },
				typescript = { 'biome', 'prettierd' },
				typescriptreact = { 'biome', 'prettierd' },
				yaml = { 'prettierd' },

				typst = { 'typstyle' },

				ruby = { 'rufo' },
				eruby = { 'erb_format' },

				rust = { 'rustfmt' },

				nix = { 'nixfmt' },

				python = { 'ruff' },
				zig = { 'zigfmt' },
			},
			format_on_save = function()
				if vim.g.conform_autoformat then
					return {
						lsp_fallback = false,
						timeout_ms = 1000,
					}
				end
			end,
			notify_on_error = false,
		})
	end,
	init = function()
		vim.api.nvim_create_user_command('ConformDisable', function()
			vim.g.conform_autoformat = false
			print('Conform: autoformat disabled')
		end, {
			desc = 'Disable autoformat-on-save',
		})

		vim.api.nvim_create_user_command('ConformEnable', function()
			vim.g.conform_autoformat = true
			print('Conform: autoformat enabled')
		end, {
			desc = 'Enable autoformat-on-save',
		})

		vim.api.nvim_create_user_command('ConformToggle', function()
			if vim.g.conform_autoformat then
				vim.cmd('ConformDisable')
			else
				vim.cmd('ConformEnable')
			end
		end, {
			desc = 'Toggle autoformat-on-save',
		})

		vim.g.conform_autoformat = true

		vim.keymap.set('n', '\\\\f', '<cmd>ConformToggle<cr>', { noremap = true })
	end,
}
