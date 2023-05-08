if vim.fn.executable 'pyright' == 0 then
	return
end

local lspconfig = require 'lspconfig'
local lsputils = require 'lsp.utils'

lspconfig.pyright.setup {
	capabilities = lsputils.make_capabilities(),
	on_attach = function(client, bufnr)
		lsputils.disable_formatting(client)
		lsputils.set_lsp_keymap(bufnr)
	end,
}
