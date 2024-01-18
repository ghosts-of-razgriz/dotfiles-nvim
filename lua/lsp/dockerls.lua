if vim.fn.executable 'docker-langserver' == 0 then
	return
end

local l = require 'lspconfig'
local u = require 'lsp.utils'

l.dockerls.setup {
	capabilties = u.make_capabilities(),
	on_attach = function(client, bufnr)
		u.disable_formatting(client)
		u.set_keymap(bufnr)
	end,
}
