local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'
local configs = require 'lspconfig.configs'

local stylua = { formatCommand = 'stylua -', formatStdin = true }

-- Check if it's already defined for when reloading this file.
if not configs.stylua then
	configs.stylua = {
		default_config = {
			cmd = { 'efm-langserver' },
			filetypes = { 'lua' },
			root_dir = util.root_pattern('.git', 'stylua.toml'),
		},
	}
end

lspconfig.stylua.setup {
	init_options = {
		codeAction = false,
		completion = false,
		documentFormatting = true,
		documentSymbol = false,
		hover = false,
	},
	filetypes = {
		'lua',
	},
	settings = {
		rootMarker = { '.git', 'stylua.toml' },
		languages = {
			lua = { stylua },
		},
	},
}

vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)]]
