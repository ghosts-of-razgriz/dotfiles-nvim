return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp',
		{ 'jackieaskins/cmp-emmet', build = 'npm run release' },
		'onsails/lspkind-nvim',
		{
			'L3MON4D3/LuaSnip',
			config = function()
				local ls = require('luasnip')
				local snippet_path = vim.fn.stdpath('config') .. '/snippets'
				require('luasnip.loaders.from_lua').load({ paths = snippet_path })

				ls.config.set_config({
					history = true,
					updateevents = 'TextChanged,TextChangedI',
					enable_autosnippets = true,
					ext_opts = {
						[require('luasnip.util.types').choiceNode] = {
							active = {
								virt_text = { { '*', 'GruvboxOrange' } },
							},
						},
					},
				})

				vim.keymap.set({ 'i', 's' }, '<c-j>', function()
					if ls.jumpable(1) then
						ls.jump(1)
					end
				end)

				vim.keymap.set({ 'i', 's' }, '<c-k>', function()
					if ls.jumpable(-1) then
						ls.jump(-1)
					end
				end)

				vim.keymap.set({ 'i', 's' }, '<c-l>', function()
					if ls.choice_active() then
						ls.change_choice(1)
					end
				end)
			end,
		},
		'saadparwaiz1/cmp_luasnip',
	},
	config = function()
		local c = require('cmp')

		c.setup({
			mapping = {
				['<c-y>'] = c.mapping.confirm({
					select = true,
					behavior = c.ConfirmBehavior.Replace,
				}),
				['<C-n>'] = c.mapping.select_next_item({ behavior = c.SelectBehavior.Insert }),
				['<C-p>'] = c.mapping.select_prev_item({ behavior = c.SelectBehavior.Insert }),
				['<C-e>'] = c.mapping({
					i = c.mapping.abort(),
					c = c.mapping.close(),
				}),
				['<c-space>'] = c.mapping({
					i = c.mapping.complete(),
					c = function(_)
						if c.visible() then
							if not c.confirm({ select = true }) then
								return
							end
						else
							c.complete()
						end
					end,
				}),
				['<C-d>'] = c.mapping.scroll_docs(-4),
				['<C-f>'] = c.mapping.scroll_docs(4),
			},
			sources = {
				{ name = 'nvim_lua', keyword_length = 2 },
				{ name = 'nvim_lsp', keyword_length = 2 },
				{ name = 'emmet', keyword_length = 1 },
				{ name = 'luasnip', keyword_length = 2 },
				{ name = 'path', keyword_length = 3 },
				{ name = 'buffer', keyword_length = 5 },
			},

			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			formatting = {
				format = require('lspkind').cmp_format({
					with_text = true,
					menu = {
						nvim_lsp = '[LSP]',
						luasnip = '[snip]',
						nvim_lua = '[api]',
						buffer = '[buf]',
						path = '[path]',
						emmet = '[em]',
					},
				}),
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
				ghost_text = false,
			},
		})

		vim.opt.pumheight = 6
	end,
}
