local M = {}

M.setup = function(capabilities)
	if vim.fn.executable('lua-language-server') == 0 then
		return
	end

	local lsp_path = string.gsub(tostring(vim.fn.system('which lua-language-server')), '\n', '')

	require('lspconfig').lua_ls.setup({
		capabilities = capabilities,
		cmd = { lsp_path, '-E' },
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT' },
				workspace = {
					checkThirdParty = false,
					library = {
						'${3rd}/luv/library',
						unpack(vim.api.nvim_get_runtime_file('', true)),
					},
				},
				completion = { callSnippet = 'Replace' },
			},
		},
	})

	if vim.fn.executable('stylua') == 1 then
		require('conform').formatters_by_ft.lua = { 'stylua' }
	end
end

return M
