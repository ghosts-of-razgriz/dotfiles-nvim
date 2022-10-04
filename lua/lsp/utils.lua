local M = {}
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local wk = require 'which-key'

function M.disable_formatting(client)
	if client.name ~= 'null-ls' then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

function M.make_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return cmp_nvim_lsp.update_capabilities(capabilities)
end

function M.set_lsp_keymap(bufnr)
	wk.register({
		name = 'LSP',
		['\\'] = {
			d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to Definition' },
			i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Show implementations' },
			f = { '<cmd>Telescope lsp_references<cr>', 'Show References' },
			r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
			y = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Show Type Definition' },
			a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
		},
		K = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
		['<c-n>'] = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'Go to Next Diagnostic' },
		['<c-p>'] = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'Go to Previous Diagnostic' },
	}, { buffer = bufnr })

	wk.register({
		['<c-x><c-x>'] = { '<cmd>lua vim.lsp.buf.signature_help()<cr>', '' },
	}, { mode = 'i', buffer = bufnr })
end

return M
