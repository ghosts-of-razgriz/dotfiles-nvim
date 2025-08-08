vim.lsp.enable({ 'emmylua_ls' })

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('laughingman-lsp-attach', { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client.server_capabilities then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			if client and client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
					buffer = event.buf,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
					buffer = event.buf,
					callback = vim.lsp.buf.clear_references,
				})
			end
		end

		local map = function(keys, fn)
			vim.keymap.set('n', keys, fn, { buffer = event.buf, noremap = true })
		end

		local prefix = '\\'

		map(prefix .. 'd', vim.lsp.buf.definition)
		map(prefix .. prefix .. 'd', vim.lsp.buf.declaration)
		map(prefix .. 'r', vim.lsp.buf.rename)
		map(prefix .. 'a', vim.lsp.buf.code_action)
		map(prefix .. 'h', vim.lsp.buf.signature_help)
		map(prefix .. 't', vim.lsp.buf.type_definition)

		map(prefix .. 'f', '<cmd>Telescope lsp_references<cr>')
		map(prefix .. 'i', '<cmd>Telescope lsp_implementations<cr>')
		map(prefix .. 's', '<cmd>Telescope lsp_document_symbols<cr>')

		map(prefix .. prefix .. 's', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
		map(prefix .. prefix .. 'q', '<cmd>LspRestart<cr>')
		map(prefix .. prefix .. 'i', '<cmd>LspInfo<cr>')
		map(prefix .. prefix .. 'c', '<cmd>ConformInfo<cr>')

		map('<c-n>', function()
			vim.diagnostic.jump({ count = 1, float = true })
		end)
		map('<c-p>', function()
			vim.diagnostic.jump({ count = -1, float = true })
		end)
		map('K', vim.lsp.buf.hover)
	end,
})

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_lines = { current_line = true },
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = '',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.HINT] = '󰟃',
			[vim.diagnostic.severity.INFO] = '',
		},
	},
})
