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
