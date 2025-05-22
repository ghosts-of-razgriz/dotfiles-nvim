local M = {}

M.init = function()
	local capabilities = require('blink.cmp').get_lsp_capabilities()
	local lsp = require('lspconfig')

	lsp.just.setup({ capabilities = capabilities })

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

	lsp.nil_ls.setup({ capabilities = capabilities })

	lsp.emmet_language_server.setup({ capabilities = capabilities })
	lsp.biome.setup({ capabilities = capabilities, cmd = { 'npx', 'biome', 'lsp-proxy' } })
	lsp.tailwindcss.setup({ capabilities = capabilities })
	lsp.ts_ls.setup({ capabilities = capabilities })
	lsp.ruby_lsp.setup({ capabilities = capabilities })
end

return M
