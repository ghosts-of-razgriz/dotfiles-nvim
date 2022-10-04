local neovim_lsp = require('lspconfig')
local keybinding = require('lsp.keybinding')

local system_name = "macOS" -- (Linux, macOS, or Windows)
local sumneko_root_path = vim.fn.expand("$CONFPATH").."/tmp/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

if vim.fn.filereadable(sumneko_binary) ~= 1 then
	if vim.fn.filereadable(sumneko_root_path) ~= 1 then
		vim.api.nvim_command('!git clone https://github.com/sumneko/lua-language-server ' .. sumneko_root_path)
		vim.api.nvim_set_current_dir(sumneko_root_path)
		vim.api.nvim_command('!git submodule update --init --recursive')
	end
	vim.api.nvim_set_current_dir(sumneko_root_path .. '/3rd/luamake')
	vim.api.nvim_command('!compile/install.sh')
	vim.api.nvim_set_current_dir(sumneko_root_path)
	vim.api.nvim_command('!./3rd/luamake/luamake rebuild')
end

neovim_lsp.sumneko_lua.setup({
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
	-- An example of settings for an LSP server.
	--    For more options, see nvim-lspconfig
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		}
	},

	on_attach = keybinding
})
