local M = {}
local cmp_nvim_lsp = require 'cmp_nvim_lsp'

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
	local settings = { silent = true }
	local set_buf_map = vim.api.nvim_buf_set_keymap

	set_buf_map(bufnr, 'n', '<m-d>d', '<cmd>lua vim.lsp.buf.definition()<cr>', settings)
	set_buf_map(bufnr, 'n', '<m-d>i', '<cmd>lua vim.lsp.buf.implementation()<cr>', settings)
	set_buf_map(bufnr, 'n', '<m-d>f', '<cmd>Telescope lsp_references<cr>', settings)
	set_buf_map(bufnr, 'n', '<m-d>r', '<cmd>lua vim.lsp.buf.rename()<cr>', settings)
	set_buf_map(bufnr, 'n', '<m-d>y', '<cmd>lua vim.lsp.buf.type_definition()<cr>', settings)
	set_buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', settings)
	set_buf_map(bufnr, 'n', '<c-n>', '<cmd>lua vim.diagnostic.goto_next()<cr>', settings)
	set_buf_map(bufnr, 'n', '<c-p>', '<cmd>lua vim.diagnostic.goto_prev()<cr>', settings)
	set_buf_map(bufnr, 'n', '<m-d>a', '<cmd>lua vim.lsp.buf.code_action()<cr>', settings)
	set_buf_map(bufnr, 'i', '<c-x><c-x>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', settings)
end

return M
