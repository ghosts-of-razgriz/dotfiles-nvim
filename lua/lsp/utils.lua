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

return M
