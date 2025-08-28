vim.lsp.enable({
	'emmylua_ls',
	'nil_ls',
	'gopls',
})

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

			if client and client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true)
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
		map(prefix .. prefix .. 'h', '<cmd>InlayHintToggle<cr>')

		map('<c-n>', function()
			vim.diagnostic.jump({ count = 1 })
		end)
		map('<c-p>', function()
			vim.diagnostic.jump({ count = -1 })
		end)
		map('K', vim.lsp.buf.hover)
	end,
})

vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = false,
	float = false,
	-- virtual_lines = { current_line = true },
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

local inlay_hint = vim.lsp.inlay_hint

vim.api.nvim_create_user_command('InlayHintDisable', function()
	if inlay_hint.is_enabled() then
		inlay_hint.enable(false, nil)
		print('Lsp: inlay hints disabled')
	end
end, { desc = 'Disable inlay hints' })

vim.api.nvim_create_user_command('InlayHintEnable', function()
	if not inlay_hint.is_enabled() then
		inlay_hint.enable(true, nil)
		print('Lsp: inlay hints enabled')
	end
end, { desc = 'Enable inlay hints' })

vim.api.nvim_create_user_command('InlayHintToggle', function()
	if inlay_hint.is_enabled() then
		inlay_hint.enable(false, nil)
		print('Lsp: inlay hints disabled')
	else
		inlay_hint.enable(true, nil)
		print('Lsp: inlay hints enabled')
	end
end, { desc = 'Toggle inlay hints' })

vim.api.nvim_create_user_command(
	'LspInfo',
	':checkhealth vim.lsp',
	{ desc = 'Alias to `:checkhealth vim.lsp`' }
)

vim.api.nvim_create_user_command('LspRestart', function(info)
	local clients = info.fargs

	-- Default to restarting all active servers
	if #clients == 0 then
		clients = vim.iter(vim.lsp.get_clients())
			:map(function(client)
				return client.name
			end)
			:totable()
	end

	for _, name in ipairs(clients) do
		if vim.lsp.config[name] == nil then
			vim.notify(("Invalid server name '%s'"):format(name))
		else
			vim.lsp.enable(name, false)
		end
	end

	local timer = assert(vim.uv.new_timer())
	timer:start(500, 0, function()
		for _, name in ipairs(clients) do
			vim.schedule_wrap(function(x)
				vim.lsp.enable(x)
			end)(name)
		end
	end)
end, {
	desc = 'Restart the given client',
	nargs = '?',
	complete = complete_client,
})
