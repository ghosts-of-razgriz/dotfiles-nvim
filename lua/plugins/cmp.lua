local cmp_config = function()
	local c = require 'cmp'
	local lspk = require 'lspkind'
	local ls = require 'luasnip'

	c.setup {
		mapping = {
			['<c-y>'] = c.mapping.confirm { select = true },
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
			{ name = 'nvim_lua', keyword_length = 2 },
			{ name = 'buffer', keyword_length = 3 },
			{ name = 'path', keyword_length = 3 },
		},
		snippet = {
			expand = function(args)
				ls.lsp_expand(args.body)
			end,
		},
		formatting = {
			format = lspk.cmp_format {
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

	vim.cmd [[set pumheight=6]]
end

local luasnip_config = function()
	local ls = require 'luasnip'
	local snippet_path = vim.fn.stdpath 'config' .. '/snippets/'
	require('luasnip.loaders.from_lua').load { paths = snippet_path }

	ls.config.set_config {
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
	}

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
end

return {
	'hrsh7th/nvim-cmp',
	config = cmp_config,
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp',
		'onsails/lspkind-nvim',
		'L3MON4D3/LuaSnip',
		{ 'saadparwaiz1/cmp_luasnip' },
	},
	event = { 'InsertEnter', config = luasnip_config },
}
