local lualine = require 'lualine'

local lualine_theme = 'catppuccin'

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

local function dirty()
	local buf = vim.fn.bufnr '%'
	local is_dirty = vim.fn.getbufinfo(buf)[1].changed
	local m = ''

	if is_dirty == 1 then
		m = ''
	end

	return m
end

local function filepath()
	local path = vim.fn.expand '%'
	if vim.fn.winwidth(0) <= 84 then
		path = vim.fn.pathshorten(path)
	end
	path = vim.fn.pathshorten(path)

	if not path or #path == 0 then
		return ''
	end

	return path
end

local function is_file_open()
	return #(vim.fn.expand '%') > 0
end

local function lsp_name()
	local msg = 'No Active LSP'
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end

	local known_clients = {}
	local client_names = {}

	for _, client in ipairs(clients) do
		local name = client.name
		if known_clients[name] == nil then
			known_clients[name] = 1
			table.insert(client_names, name)
		end
	end

	return table.concat(client_names, ', ')
end

local function lsp_format()
	if vim.g.lsp_format == 1 then
		return ''
	else
		return ''
	end
end

lualine.setup {
	options = {
		theme = lualine_theme,
		component_separators = { left = '|', right = '|' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			'term',
			'terminal',
			'TelescopePrompt',
			'dapui_scopes',
			'dapui_breakpoints',
			'dapui_stacks',
			'dapui_watches',
			'dap-repl',
		},
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ get_mode, separator = { left = '', right = '' } },
		},
		lualine_b = { 'branch' },
		lualine_c = {
			{ 'filetype', icon_only = true, separator = '' },
			-- { filepath, separator = '' },
			{ 'filename', path = 1 },
			dirty,
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				sections = { 'error', 'warn', 'info', 'hint' },
				always_visible = is_file_open,
				update_in_insert = true,
			},
		},
		lualine_x = {
			{ lsp_format, icon = '', color = { fg = '#ffeaa7', gui = 'bold' } },
			{ lsp_name, icon = '  LSP:', color = { fg = '#ffffff', gui = 'bold' } },
			'diff',
			'filetype',
		},
		lualine_y = { 'progress' },
		lualine_z = { { 'location', separator = { left = '', right = '' } } },
	},
	inactive_sections = {},
	extensions = {},
}
