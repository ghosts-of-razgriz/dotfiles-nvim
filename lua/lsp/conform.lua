local c = require 'conform'

c.setup {
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
}

if vim.fn.executable 'stylua' == 1 then
	c.formatters_by_ft.lua = { 'stylua' }
end
