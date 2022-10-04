local function set_keymap(...)
	vim.api.nvim_set_keymap(...)
end
local opts = { noremap = true, silent = true, expr = true }

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t '<c-n>'
	else
		return t '<tab>'
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t '<c-p>'
	else
		return t '<s-tab>'
	end
end

set_keymap('i', '<tab>', 'v:lua.tab_complete()', opts)
set_keymap('i', '<s-tab>', 'v:lua.s_tab_complete()', opts)
