local null_ls = require 'null-ls'
local b = null_ls.builtins
local utils = require 'utils'

if vim.fn.executable 'stylua' == 0 then
	if vim.fn.executable 'brew' == 0 then
		print 'Error: brew is required to install stylua'
	end

	print 'Info: Installing stylua'
	utils.run 'brew install stylua'
end

if vim.fn.executable 'goimports' == 0 then
	if vim.fn.executable 'go' == 0 then
		print 'Error: go is required to install goimports'
	end

	print 'Info: Installing goimports'
	utils.run 'go install golang.org/x/tools/cmd/goimports@latest'
end

null_ls.setup {
	sources = {
		b.formatting.stylua,
		b.formatting.goimports,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
		end
	end,
}
