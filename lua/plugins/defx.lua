-- TODO: replace this

return {
	'Shougo/defx.nvim',
	build = ':UpdateRemotePlugins',
	cmd = 'Defx',
	config = function()
		vim.fn['defx#custom#option'](
			'_',
			{ columns = 'indent:icons:filename:indent:git:indent:time:indent:size' }
		)

		local augDefexKeymap = vim.api.nvim_create_augroup('DefxKeymap', { clear = true })
		vim.api.nvim_create_autocmd('FileType', {
			pattern = { 'defx' },
			callback = function()
				vim.schedule(function()
					DefxKeymap()
				end)
			end,
			group = augDefexKeymap,
		})
		vim.cmd([[highlight! link defxExrenameModified NvimStringBody]])
	end,

	init = function()
		local leader = '<leader>'
		local localleader = '<localleader>'
		local nore = { noremap = true }

		vim.keymap.set(
			'n',
			leader .. leader .. 'e',
			'<cmd>Defx -buffer-name=defx -show-ignored-files<cr>',
			nore
		)
		vim.keymap.set(
			'n',
			leader .. leader .. 'E',
			'<cmd>Defx -new -buffer-name=defx-new -show-ignored-files<cr>',
			nore
		)
		vim.keymap.set(
			'n',
			localleader .. localleader .. 'e',
			"<cmd>Defx -buffer-name=defx -show-ignored-files `expand('%:p:h')`<cr>",
			nore
		)

		function DefxKeymap()
			local opts = { noremap = true, expr = true, silent = true, buffer = 0 }

			vim.keymap.set('n', '*', 'defx#do_action("toggle_select_all")', opts)
			vim.keymap.set('n', '<cr>', 'defx#async_action("drop")', opts)
			vim.keymap.set('n', '<tab>', 'defx#async_action("toggle_select") . "j"', opts)
			vim.keymap.set('n', 'K', 'defx#do_action("new_directory")', opts)
			vim.keymap.set('n', 'N', 'defx#do_action("new_file")', opts)
			vim.keymap.set('n', '<c-p>', 'defx#do_action("preview")', opts)
			vim.keymap.set('n', 'h', 'defx#async_action("cd", [".."])', opts)
			vim.keymap.set('n', 'j', 'line(".") == line("$") ? "gg" : "j"', opts)
			vim.keymap.set('n', 'k', 'line(".") == 1 ? "G" : "k"', opts)
			vim.keymap.set('n', 'l', 'defx#async_action("open")', opts)
			vim.keymap.set('n', 'd', 'defx#do_action("remove")', opts)
			vim.keymap.set('n', 'c', 'defx#do_action("copy")', opts)
			vim.keymap.set('n', 'm', 'defx#do_action("move")', opts)
			vim.keymap.set('n', 'p', 'defx#do_action("paste")', opts)
			vim.keymap.set('n', 'r', 'defx#do_action("rename")', opts)
			vim.keymap.set('n', 'q', 'defx#do_action("quit")', opts)
			vim.keymap.set('n', 'o', 'defx#do_action("open_or_close_tree")', opts)
			vim.keymap.set('n', 'O', 'defx#do_action("open_tree_recursive")', opts)
			vim.keymap.set('n', '<c-r>', 'defx#do_action("redraw")', opts)
			vim.keymap.set(
				'n',
				'<c-x>',
				'defx#async_action("multi", ["quit", ["drop", "split"]])',
				opts
			)
			vim.keymap.set(
				'n',
				'<c-v>',
				'defx#async_action("multi", ["quit", ["drop", "vsplit"]])',
				opts
			)
		end
	end,
	dependencies = {
		{
			'kristijanhusak/defx-icons',
		},
	},
}
