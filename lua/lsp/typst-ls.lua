if vim.fn.executable 'typst-lsp' == 0 then
	return
end

local l = require 'lspconfig'
local u = require 'lsp.utils'

l.typst_lsp.setup {
	capabilities = u.make_capabilities(),
	on_attach = function(client, bufnr)
		u.disable_formatting(client)
		u.set_keymap(bufnr)
	end,
	settings = {
		exportPdf = 'never',
	},
}
