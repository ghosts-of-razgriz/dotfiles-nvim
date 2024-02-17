if vim.fn.executable 'pylyzer' == 0 then
	return
end

local l = require 'lspconfig'
local u = require 'lsp.utils'

l.pylyzer.setup {
	capabilities = u.make_capabilities(),
	on_attach = function(client, bufnr)
		u.disable_formatting(client)
		u.set_keymap(bufnr)
	end,
}
