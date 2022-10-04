local null_ls = require 'null-ls'
local b = null_ls.builtins
local utils = require 'utils'
local lsputils = require 'lspconfig.util'

if vim.fn.executable 'stylua' == 0 then
	if vim.fn.executable 'brew' == 0 then
		print 'Error: brew is required to install stylua'
	end

	print 'Info: Installing stylua'
	utils.run 'brew install stylua'
end

if vim.fn.executable 'goimports' == 0 then
	if vim.fn.executable 'go' == 0 then
		print 'Error: go is required to install goimports'
	end

	print 'Info: Installing goimports'
	utils.run 'go install golang.org/x/tools/cmd/goimports@latest'
end

if vim.fn.executable 'prettierd' == 0 then
	if vim.fn.executable 'yarn' == 0 then
		print 'Error: yarn is required to install prettierd'
	end

	print 'Info: Installing prettierd'
	utils.run 'yarn global add @fsouza/prettierd'
end

if vim.fn.executable 'eslint_d' == 0 then
	if vim.fn.executable 'yarn' == 0 then
		print 'Error: yarn is required to install prettierd'
	end

	print 'Info: Installed eslint_d'
	utils.run 'yarn global add eslint_d'
end

local function has_eslint(params)
	return lsputils.root_pattern('package.json', '.eslintrc.json', '.eslintrc.yaml')(params.bufname)
end

null_ls.setup {
	sources = {
		b.formatting.stylua,
		b.formatting.goimports,
		b.formatting.prettierd,
		b.code_actions.eslint_d.with {
			cwd = has_eslint,
		},
		b.diagnostics.eslint_d.with {
			cwd = has_eslint,
		},
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
		end
	end,
}
