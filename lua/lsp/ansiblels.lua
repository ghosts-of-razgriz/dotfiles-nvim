if vim.fn.executable 'ansible-language-server' then
	return
end

local l = require 'lspconfig'
local u = require 'lsp.utils'

l.ansiblels.setup {
	capabilities = u.make_capabilities(),
	on_attach = function(client, bufnr)
		u.disable_formatting(client)
		u.set_keymap(bufnr)
	end,
}
