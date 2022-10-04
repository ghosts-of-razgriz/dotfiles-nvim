local fn = vim.fn
local lsp = require 'lspconfig'
local function run(...)
	local cmd = string.format('!%s', ...)
	vim.api.nvim_command(cmd)
end

local system_name = 'macOS'
local sumneko_repo = 'https://github.com/sumneko/lua-language-server'
local sumneko_root_path = fn.stdpath 'config' .. '/tmp/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'

if fn.filereadable(sumneko_binary) ~= 1 then
	if fn.filereadable(sumneko_root_path) ~= 1 then
		run(string.format('git clone %s %s', sumneko_repo, sumneko_root_path))
		vim.api.nvim_set_current_dir(sumneko_root_path)
		run 'git submodule update --init --recursive'
	end

	vim.api.nvim_set_current_dir(sumneko_root_path .. '/3rd/luamake')
	run 'compile/install.sh'
	vim.api.nvim_set_current_dir(sumneko_root_path)
	run './3rd/luamake/luamake rebuild'
end

lsp.sumneko_lua.setup {
	cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
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
