local neovim_lsp = require('lspconfig')
local keybinding = require('lsp.keybinding')

-- lua
local luaConfig = vim.fn.expand('$CONFPATH') .. '/lua/lsp/lua_format_config.yml'

local luaFmtCmd = 'lua-format -i --config ' .. luaConfig

local luaFormat = { formatCommand = luaFmtCmd, formatStdin = true }

-- javascript
local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
}

local prettier = {
	formatCommand = "npx prettier --stdin-filepath ${INPUT}",
	formatStdin = true,
}

-- efm
neovim_lsp.efm.setup {
	on_attach = keybinding,
	init_options = {
		codeAction = true,
		completion = true,
		documentFormatting = true,
		documentSymbol = true,
		hover = true,
	},
	filetypes = {
		'javascript',
		'javascript.jsx',
		'javascriptreact',
		'lua',
		'typescript',
		'typescript.tsx',
		'typescriptreact',
	},
	settings = {
		rootMarkers = { '.git/' },
		languages = {
			javascript = { eslint, prettier },
			javascriptreact = { eslint, prettier },
			["javascript.jsx"] = { eslint, prettier },
			lua = { luaFormat },
			typescript = { eslint, prettier },
			typescriptreact = { eslint, prettier },
			["typescript.tsx"] = { eslint, prettier },
		},
	},
}

vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 1000)]]
vim.cmd [[autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)]]

