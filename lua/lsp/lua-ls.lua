if vim.fn.executable 'lua-language-server' == 0 then
	return
end

local l = require 'lspconfig'
local u = require 'lsp.utils'
local lsp_path = string.gsub(vim.fn.system 'which lua-language-server', '\n', '')

l.lua_ls.setup {
	capabilties = u.make_capabilties(),
	on_attach = function(client, bufnr)
		u.disable_formatting(client)
		u.set_keymap(bufnr)
	end,
	cmd = { lsp_path, '-E' },
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
			diagnostics = { globals = { 'vim' } },
			workspace = {
				library = {
					[vim.fn.expand '$VIMRUNTIME/lua'] = true,
					[vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
				},
			},
		},
	},
}
