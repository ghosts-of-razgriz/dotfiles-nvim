local cmp = require 'cmp'
local lspkind = require 'lspkind'

lspkind.init()

cmp.setup {
	mapping = {
		['<CR>'] = cmp.mapping.confirm { select = true },
		['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		['<C-e>'] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
	},
	sources = {
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp', keyword_length = 1 },
		{ name = 'path', keyword_length = 3 },
		{ name = 'buffer', keyword_length = 3 },
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = '[buf]',
				nvim_lsp = '[LSP]',
				nvim_lua = '[api]',
				path = '[path]',
				luasnip = '[snip]',
			},
		},
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
}

vim.cmd [[set pumheight=5]]
