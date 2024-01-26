local c = require 'conform'

vim.api.nvim_create_user_command('ConformDisable', function()
	vim.g.conform_autoformat = false
	print 'Conform: autoformat disabled'
end, {
	desc = 'Disable autoformat-on-save',
})

vim.api.nvim_create_user_command('ConformEnable', function()
	vim.g.conform_autoformat = true
	print 'Conform: autoformat enabled'
end, {
	desc = 'Enable autoformat-on-save',
})

vim.api.nvim_create_user_command('ConformToggle', function()
	if vim.g.conform_autoformat then
		vim.cmd 'ConformDisable'
	else
		vim.cmd 'ConformEnable'
	end
end, {
	desc = 'Toggle autoformat-on-save',
})

vim.g.conform_autoformat = true

c.setup {
	format_on_save = function()
		if vim.g.conform_autoformat then
			return {
				lsp_fallback = false,
				timeout_ms = 500,
			}
		end
	end,
	notify_on_error = false,
}

if vim.fn.executable 'stylua' == 1 then
	c.formatters_by_ft.lua = { 'stylua' }
end

if vim.fn.executable 'goimports' == 1 then
	c.formatters_by_ft.go = { 'goimports' }
end

if vim.fn.executable 'typstfmt' == 1 then
	c.formatters_by_ft.typst = { 'typstfmt' }
end

if vim.fn.executable 'prettierd' == 1 then
	c.formatters_by_ft.html = { 'prettierd' }
	c.formatters_by_ft.javascript = { 'prettierd' }
	c.formatters_by_ft.typescript = { 'prettierd' }
	c.formatters_by_ft.json = { 'prettierd' }
	c.formatters_by_ft.css = { 'prettierd' }
	c.formatters_by_ft.yaml = { 'prettierd' }
end

vim.keymap.set('n', '<c-\\>f', '<cmd>ConformToggle<cr>', { noremap = true })
