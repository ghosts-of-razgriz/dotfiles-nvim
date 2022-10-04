local lspconfig = require 'lspconfig'
local lsputils = require 'lsp.utils'
local utils = require 'utils'

if vim.fn.executable 'tsserver' == 0 then
	if vim.fn.executable 'yarn' == 0 then
		print 'Error: yarn is required to install typescript'
	end

	print 'Info: Installing typescript'
	utils.run 'yarn global add typescript'
end

if vim.fn.executable 'typescript-language-server' == 0 then
	if vim.fn.executable 'yarn' == 0 then
		print 'Error: yarn is required to install typescript-language-server'
	end

	print 'Info: Installing typescript'
	utils.run 'yarn global add typescript-language-server'
end

lspconfig.tsserver.setup {
	capabilities = lsputils.make_capabilities(),
	on_attach = function(client, bufnr)
		lsputils.disable_formatting(client)
		lsputils.set_lsp_keymap(bufnr)
	end,
}
