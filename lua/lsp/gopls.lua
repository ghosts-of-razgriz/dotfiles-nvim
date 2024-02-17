if vim.fn.executable('gopls') == 0 then
	return
end

local l = require('lspconfig')
local u = require('lsp.utils')

l.gopls.setup({
	capabilities = u.make_capabilities(),
	on_attach = function(client, bufnr)
		u.disable_formatting(client)
		u.set_keymap(bufnr)
	end,
	cmd = { 'gopls', 'serve' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl', 'gohtmltmpl' },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})
