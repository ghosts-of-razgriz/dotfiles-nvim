local fn = vim.fn
local lspconfig = require 'lspconfig'
local lsputils = require 'lsp.utils'

local sumneko_repo = 'https://github.com/sumneko/lua-language-server'
local sumneko_root_path = fn.stdpath 'config' .. '/tmp/lua-language-server'
local sumneko_bin = sumneko_root_path .. '/bin/lua-language-server'
local set_dir = vim.api.nvim_set_current_dir

if fn.filereadable(sumneko_bin) ~= 1 then
	local working_dir = fn.getcwd()
	if fn.filereadable(sumneko_root_path) ~= 1 then
		lsputils.run(string.format('git clone %s %s', sumneko_repo, sumneko_root_path))
		set_dir(sumneko_root_path)
		lsputils.run 'git submodule update --init --recursive'
	end

	set_dir(sumneko_root_path .. '/3rd/luamake')
	lsputils.run 'compile/install.sh'
	set_dir(sumneko_root_path)
	lsputils.run './3rd/luamake/luamake rebuild'
	set_dir(working_dir)
end

lspconfig.sumneko_lua.setup {
	capabilities = lsputils.make_capabilities(),
	on_attach = lsputils.disable_formatting,
	cmd = { sumneko_bin, '-E', sumneko_root_path .. '/main.lua' },
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
