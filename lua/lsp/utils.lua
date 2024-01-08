local M = {}

function M.disable_formatting(client)
	client.server_capabilities.document_formatting = false
	client.server_capabilities.document_range_formatting = false
end

function M.make_capabilities()
	return vim.lsp.protocol.make_client_capabilities()
end

function M.set_keymap(bufnr)
	local prefix = '\\'
	local opts = { noremap = true, buffer = bufnr }

	vim.keymap.set('n', prefix .. 'd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', prefix .. 'r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set('n', prefix .. 'f', '<cmd>Telescope lsp_references<cr>', opts)
	vim.keymap.set('n', prefix .. 'a', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', '<c-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
	vim.keymap.set('n', '<c-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)

	vim.keymap.set('i', '<c-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
end

function M.on_attach(client)
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = { '<buffer>' },
			callback = function()
				if vim.g.lsp_format == 1 then
					vim.lsp.buf.format()
				end
			end,
		})
	end
end

return M
