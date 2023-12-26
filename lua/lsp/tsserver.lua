if vim.fn.executable 'typescript-language-server' == 0 then
	return
end

local lspconfig = require 'lspconfig'
local lsputil = require 'lsp.utils'

lspconfig.tsserver.setup {
	capabilities = lsputil.make_capabilities(),
	on_attach = function(client, bufnr)
		lsputil.disable_formatting(client)
		lsputil.set_lsp_keymap(bufnr)
	end,
}
