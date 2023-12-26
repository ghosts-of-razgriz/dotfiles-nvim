local M = {}

function M.disable_formatting(client)
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false
end

function M.make_capabilties()
	return vim.lsp.protocol.make_client_capabilities()
end

function M.set_keymap(bufnr)
	local prefix = '\\'
	local opts = { noremap = true }

	vim.keymap.set('n', prefix .. 'd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', prefix .. 'r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
end

return M
