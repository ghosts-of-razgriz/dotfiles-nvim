local null_ls = require 'null-ls'
local b = null_ls.builtins

null_ls.setup {
	sources = {
		b.formatting.stylua,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
		end
	end,
}
