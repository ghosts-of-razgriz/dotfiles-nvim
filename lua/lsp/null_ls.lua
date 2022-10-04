local null_ls = require 'null-ls'
local b = null_ls.builtins
local utils = require 'utils'
local lsputils = require 'lspconfig.util'

vim.g.lsp_format = 1

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

if vim.fn.executable 'clang-format' == 0 then
	if vim.fn.executable 'brew' == 0 then
		print 'Error: brew is required to install clang-format'
	end

	print 'Info: Installing clang-format'
	utils.run 'brew install clang-format'
end

local function has_eslint(params)
	return lsputils.root_pattern('package.json', '.eslintrc.json', '.eslintrc.yaml')(params.bufname)
end

null_ls.setup {
	sources = {
		b.code_actions.eslint.with {
			cwd = has_eslint,
		},
		b.diagnostics.eslint.with {
			cwd = has_eslint,
		},
		b.formatting.clang_format.with {
			filetypes = { 'c', 'cpp', 'cs', 'java', 'objc', 'objcpp' },
		},
		b.formatting.goimports,
		b.formatting.prettierd,
		b.formatting.stylua,
	},
	on_attach = function(client)
		P(client.server_capabilities)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd('BufWritePre', {
				pattern = { '<buffer>' },
				callback = function()
					if vim.g.lsp_format == 1 then
						vim.lsp.buf.format()
					end
				end,
			})
		end
	end,
}
