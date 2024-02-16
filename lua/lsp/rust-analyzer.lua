if vim.fn.executable 'rust-analyzer' == 0 then
	return
end

local l = require 'lspconfig'
local u = require 'lsp.utils'

l.rust_analyzer.setup {
	capabilities = u.make_capabilities(),
	on_attach = function(client, bufnr)
		u.disable_formatting(client)
		u.set_keymap(bufnr)
	end,
	settings = {
		['rust-analyzer'] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
}
