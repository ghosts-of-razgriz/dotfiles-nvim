return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'j-hui/fidget.nvim', opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('laughingman-lsp-attach', { clear = true }),
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				if client then
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
				map(prefix .. 'D', vim.lsp.buf.declaration)
				map(prefix .. 'r', vim.lsp.buf.rename)
				map(prefix .. 'a', vim.lsp.buf.code_action)
				map(prefix .. 'h', vim.lsp.buf.signature_help)

				map(prefix .. 'f', '<cmd>Telescope lsp_references<cr>')
				map(prefix .. 'i', '<cmd>Telescope lsp_implementations<cr>')
				map(prefix .. 'w', '<cmd>Telescope lsp_document_symbols<cr>')

				map(prefix .. prefix .. 'w', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>')
				map(prefix .. prefix .. 'q', '<cmd>LspRestart<cr>')
				map(prefix .. prefix .. 'i', '<cmd>LspInfo<cr>')

				map('<c-n>', vim.diagnostic.goto_next)
				map('<c-p>', vim.diagnostic.goto_prev)
				map('K', vim.lsp.buf.hover)
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend(
			'force',
			capabilities,
			require('cmp_nvim_lsp').default_capabilities()
		)

		require('lsp.lua-ls').setup(capabilities)
	end,
}