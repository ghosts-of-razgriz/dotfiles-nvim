local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local conf = require('telescope.config').values
local sorter = require('telescope.sorters').empty()
local telescope = require('telescope')

local live_multigrep = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()

	local finder = finders.new_async_job({
		command_generator = function(prompt)
			if not prompt or prompt == '' then
				return nil
			end

			local pieces = vim.split(prompt, '  ')
			local args = { 'rg' }
			if pieces[1] then
				table.insert(args, '--regexp')
				table.insert(args, pieces[1])
			end

			if pieces[2] then
				table.insert(args, '--glob')
				table.insert(args, pieces[2])
			end

			return vim.list_extend(args, {
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
			})
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	})

	pickers
		.new(opts, {
			debounce = 100,
			prompt_title = 'Live Multi Grep',
			finder = finder,
			previewer = conf.grep_previewer(opts),
			sorter = sorter,
		})
		:find()
end

return telescope.register_extension({
	exports = {
		live_multigrep = live_multigrep,
	},
})
