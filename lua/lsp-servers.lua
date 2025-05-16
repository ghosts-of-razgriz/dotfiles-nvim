local M = {}

M.init = function()
	local capabilities = require('blink.cmp').get_lsp_capabilities()
	local lsp = require('lspconfig')

	lsp.lua_ls.setup({
		capabilities = capabilities,
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
end

return M
