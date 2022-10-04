local neovim_lsp = require 'lspconfig'
local util = require 'lspconfig.util'
local configs = require 'lspconfig/configs'
local keymap = require 'hass.lsp.keymap'

local luaFormat = { formatCommand = 'stylua -', formatStdin = true }

-- Check if it's already defined for when reloading this file.
if not neovim_lsp.hassLua then
	configs.hassLua = {
		default_config = {
			cmd = { 'efm-langserver' },
			filetypes = { 'lua' },
			root_dir = util.root_pattern('.git', 'stylua.toml'),
		},
	}
end

neovim_lsp.hassLua.setup {
	on_attach = keymap,
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
			lua = { luaFormat },
		},
	},
}

vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)]]
