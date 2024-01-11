local c = require 'conform'

c.setup {
	format_on_save = {
		lsp_fallback = false,
		timeout_ms = 500,
	},
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
end
