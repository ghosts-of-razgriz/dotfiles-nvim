if vim.fn.executable 'lua-language-server' == 0 then
	return
end

local fn = vim.fn
local lspconfig = require 'lspconfig'
local lsputils = require 'lsp.utils'
local sumneko_bin = fn.system 'which lua-language-server'
sumneko_bin = string.gsub(sumneko_bin, '\n', '')

lspconfig.sumneko_lua.setup {
	capabilities = lsputils.make_capabilities(),
	on_attach = function(client, bufnr)
		lsputils.disable_formatting(client)
		lsputils.set_lsp_keymap(bufnr)
	end,
	cmd = { sumneko_bin, '-E' },
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
			diagnostics = { globals = { 'vim' } },
			workspace = {
				library = {
					[fn.expand '$VIMRUNTIME/lua'] = true,
					[fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
				},
			},
		},
	},
}
