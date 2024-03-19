local M = {}

M.setup = function(_)
	if vim.fn.executable('fish_indent') == 1 then
		require('conform').formatters_by_ft.fish = { 'fish_indent' }
	end
end

return M
