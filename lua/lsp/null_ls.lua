local null_ls = require 'null-ls'
local b = null_ls.builtins
local lsputils = require 'lspconfig.util'

vim.g.lsp_format = 1

local function has_eslint(params)
	return lsputils.root_pattern('package.json', '.eslintrc.json', '.eslintrc.yaml')(params.bufname)
end

local function build_sources()
	local sources = {}

	-- stylua
	if vim.fn.executable 'stylua' == 1 then
		table.insert(sources, b.formatting.stylua)
	end

	-- goimports
	if vim.fn.executable 'goimports' == 1 then
		table.insert(sources, b.formatting.goimports)
	end

	-- eslint
	if vim.fn.executable 'eslint_d' == 1 then
		table.insert(
			sources,
			b.code_actions.eslint_d.with {
				cwd = has_eslint,
			}
		)
		table.insert(
			sources,
			b.diagnostics.eslint_d.with {
				cwd = has_eslint,
			}
		)
	end

	-- prettier
	if vim.fn.executable 'prettierd' == 1 then
		table.insert(sources, b.formatting.prettierd)
	end

	-- fish
	if vim.fn.executable 'fish' == 1 then
		table.insert(sources, b.diagnostics.fish)
	end

	-- fish formatter
	if vim.fn.executable 'fish_indent' == 1 then
		table.insert(sources, b.formatting.fish_indent)
	end

	return sources
end

null_ls.setup {
	sources = build_sources(),
	on_attach = function(client)
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
