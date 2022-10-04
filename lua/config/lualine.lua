local lualine = require 'lualine'

local lualine_theme = 'dracula'

local mode_icons = {
	['n'] = '🄽',
	['nov'] = '🄽',
	['noV'] = '🄽',
	['no'] = '🄽',
	['niI'] = '🄽',
	['niR'] = '🄽',
	['niV'] = '🄽',
	['v'] = '🅅',
	['V'] = '🅅',
	['\22'] = '🅅', -- visual-block
	['s'] = '🅂',
	['S'] = '🅂',
	[''] = '🅂',
	['i'] = '🄸',
	['ic'] = '🄸',
	['ix'] = '🄸',
	['R'] = '🅁',
	['Rc'] = '🅁',
	['Rv'] = '🅁',
	['Rx'] = '🅁',
	['r'] = '🅁',
	['rm'] = '🅁',
	['r?'] = '🅁',
	['c'] = '🄲',
	['cv'] = '🄲',
	['ce'] = '🄲',
	['!'] = '🅃',
	['t'] = '🅃',
}

local function get_mode()
	local mode = vim.api.nvim_get_mode().mode
	if mode_icons[mode] == nil then
		return mode
	end

	return mode_icons[mode] .. ' '
end

local function filepath()
	local path = vim.fn.expand '%'
	if vim.fn.winwidth(0) <= 84 then
		path = vim.fn.pathshorten(path)
	end

	if not path or #path == 0 then
		return ''
	end

	local icon = require('nvim-web-devicons').get_icon(path)
	return icon .. '  ' .. path
end

local function is_file_open()
	return #(vim.fn.expand '%') > 0
end

lualine.setup {
	options = {
		theme = lualine_theme,
		disabled_filetypes = { 'term', 'terminal', 'TelescopePrompt' },
	},
	sections = {
		lualine_a = { get_mode },
		lualine_b = { 'branch' },
		lualine_c = {
			filepath,
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				sections = { 'error', 'warn', 'info', 'hint' },
				always_visible = is_file_open,
				update_in_insert = true,
			},
		},
		lualine_x = { 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
	inactive_sections = {},
	extensions = { 'nvim-tree' },
}
