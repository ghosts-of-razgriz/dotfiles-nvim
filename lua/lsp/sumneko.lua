local fn = vim.fn
local lspconfig = require 'lspconfig'

local function run(...)
	local cmd = string.format('!%s', ...)
	vim.api.nvim_command(cmd)
end

local sumneko_repo = 'https://github.com/sumneko/lua-language-server'
local sumneko_root_path = fn.stdpath 'config' .. '/tmp/lua-language-server'
local sumneko_bin = sumneko_root_path .. '/bin/lua-language-server'
local set_dir = vim.api.nvim_set_current_dir

if fn.filereadable(sumneko_bin) ~= 1 then
	local working_dir = fn.getcwd()
	if fn.filereadable(sumneko_root_path) ~= 1 then
		run(string.format('git clone %s %s', sumneko_repo, sumneko_root_path))
		set_dir(sumneko_root_path)
		run 'git submodule update --init --recursive'
	end

	set_dir(sumneko_root_path .. '/3rd/luamake')
	run 'compile/install.sh'
	set_dir(sumneko_root_path)
	run './3rd/luamake/luamake rebuild'
	set_dir(working_dir)
end

lspconfig.sumneko_lua.setup {
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end,
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
