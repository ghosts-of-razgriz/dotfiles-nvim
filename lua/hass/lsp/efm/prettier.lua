local lspconfig = require 'lspconfig'
local util = require 'lspconfig.util'
local configs = require 'lspconfig.configs'

local prettier = { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true }

if not configs.prettier then
	configs.prettier = {
		default_config = {
			cmd = { 'efm-langserver' },
			filetypes = { 'javascript', 'html', 'css', 'json', 'yaml' },
			root_dir = util.root_pattern('.git', 'package.json'),
		},
	}
end

lspconfig.prettier.setup {
	init_options = {
		codeAction = false,
		completion = false,
		documentFormatting = true,
		documentSymbol = false,
		hover = false,
	},
	settings = {
		rootMarker = { '.git', 'package.json' },
		languages = {
			javascript = { prettier },
			html = { prettier },
			css = { prettier },
			json = { prettier },
			yaml = { prettier },
		},
	},
}

vim.cmd [[autocmd BufWritePre *.js,*.jsx,*.html,*.css,*.json,*.yml,*.yaml lua vim.lsp.buf.formatting_sync(nil, 1000)]]
