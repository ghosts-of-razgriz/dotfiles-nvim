local trouble_config = function()
	local t = require 'trouble'

	t.setup {
		position = 'bottom',
		height = 8,
		-- action_keys
		auto_open = false,
		auto_close = false,
		use_daignostic_signs = true,
	}
end

local trouble_init = function()
	local prefix = '†' -- <m-t> alt-t
	local nore = { noremap = true }

	vim.keymap.set('n', prefix .. prefix, '<cmd>TroubleToggle<cr>', nore)
	vim.keymap.set('n', prefix .. 'q', '<cmd>TroubleToggle quickfix<cr>', nore)
end

return {
	'neovim/nvim-lspconfig',
	name = 'lspconfig',
	config = function()
		local signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰋽 ', Info = '󰌶 ' }

		for type, icon in pairs(signs) do
			local hl = 'DiagnosticSign' .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
		end

		vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics,
			{ virtual_text = { spacing = 5, prefix = ' ' } }
		)

		require 'lsp.conform'
		require 'lsp.lua-ls'
		require 'lsp.typst-ls'
	end,
	dependencies = {
		'stevearc/conform.nvim',
		{
			'folke/trouble.nvim',
			dependencies = { 'kyazdani42/nvim-web-devicons' },
			config = trouble_config,
			init = trouble_init,
		},
		'j-hui/fidget.nvim',
	},
}
