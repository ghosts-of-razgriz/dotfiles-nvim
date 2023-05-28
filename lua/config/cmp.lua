local cmp = require 'cmp'
local lspkind = require 'lspkind'
local ls = require 'luasnip'

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
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
	},
	sources = {
		{ name = 'nvim_lsp', keyword_length = 1 },
		{ name = 'luasnip', keyword_length = 1 },
		{ name = 'nvim_lua' },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'path', keyword_length = 3 },
	},
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				nvim_lsp = '[LSP]',
				luasnip = '[snip]',
				nvim_lua = '[api]',
				buffer = '[buf]',
				path = '[path]',
			},
		},
	},
	window = {
		completion = {
			border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
		},
		documentation = {
			border = { '╔', '═', '╗', '║', '╝', '═', '╚', '║' },
		},
	},
	experimental = {
		native_menu = false,
		ghost_text = false,
	},
}

vim.cmd [[set pumheight=5]]
