if vim.fn.executable 'emmet-ls' == 0 then
	return
end

local lspconfig = require 'lspconfig'
local lsputils = require 'lsp.utils'

lspconfig.emmet_ls.setup {
	capabilities = lsputils.make_capabilities(),
	on_attach = function(client, bufnr)
		lsputils.disable_formatting(client)
		lsputils.set_lsp_keymap(bufnr)
	end,
	filetypes = {
		'css',
		'eruby',
		'gohtmltmpl',
		'html',
		'javascriptreact',
		'less',
		'sass',
		'scss',
		'typescriptreact',
	},
}
