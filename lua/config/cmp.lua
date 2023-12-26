local c = require 'cmp'
local lspkind = require 'lspkind'
local ls = require 'luasnip'

lspkind.init()

c.setup {
	mapping = {
		['<CR>'] = c.mapping.confirm { select = true },
		['<C-n>'] = c.mapping.select_next_item { behavior = c.SelectBehavior.Insert },
		['<C-p>'] = c.mapping.select_prev_item { behavior = c.SelectBehavior.Insert },
		['<C-e>'] = c.mapping {
			i = c.mapping.abort(),
			c = c.mapping.close(),
		},
		['<C-Space>'] = c.mapping(c.mapping.complete(), { 'i', 'c' }),
		['<C-d>'] = c.mapping.scroll_docs(-4),
		['<C-f>'] = c.mapping.scroll_docs(4),
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
