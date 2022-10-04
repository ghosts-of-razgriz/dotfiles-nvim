local lspconfig = require 'lspconfig'
local lsputil = require 'lspconfig.util'
local configs = require 'lspconfig.configs'

local stylua = { formatCommand = 'stylua -', formatStdin = true }

if not configs.stylua then
	configs.stylua = {
		default_config = {
			cmd = { 'efm-langserver' },
			filetypes = { 'lua' },
			root_dir = lsputil.root_pattern('.git', 'stylua.toml'),
		},
	}
end

lspconfig.stylua.setup {
	init_options = {
		codeAction = false,
		completion = false,
		documentFormatting = true,
		documentSumbol = false,
		hover = false,
	},
	settings = {
		languages = {
			lua = { stylua },
		},
	},
}

vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)]]
