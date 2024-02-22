local o = vim.opt

-- ignore files
o.wildignore = { '*.o', '*~' }

-- cmdline completion floating window
o.pumblend = 17
o.wildmode = 'longest:full'
o.wildoptions = 'pum'

o.cmdheight = 1 -- cmd bar height
o.cursorline = true -- display current line cursor
o.equalalways = false -- don't auto resize
o.hidden = false -- don't keep buffers hanging about
o.scrolloff = 8 -- show lines above and below cursor
o.showcmd = true -- show cmd
o.showmatch = true -- show matching bracket
o.showmode = false -- diable mode display
o.smoothscroll = true -- scrolling with screen lines
o.updatetime = 1000 -- make updates faster
o.belloff = 'all' -- disable bell
o.mouse = '' -- diable mouse
o.laststatus = 3 -- global statusline, overwritten by lualine
o.virtualedit = 'block' -- visual block can select empty space

-- line numbering
o.number = true
o.relativenumber = true

-- split directions
o.splitright = true
o.splitbelow = true

-- tabs
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

-- indentation and wrapping
o.autoindent = true
o.wrap = true
o.breakindent = true
o.showbreak = string.rep(' ', 3)
o.linebreak = true

-- search
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.smartcase = true
o.inccommand = 'split'

-- persistent undo
o.undodir = vim.fn.stdpath('state') .. '/undo'
o.undofile = true

-- swap files
o.directory = vim.fn.stdpath('state') .. '/swap//'
o.swapfile = true

o.formatoptions = o.formatoptions
	- 'a' -- Auto formatting is BAD.
	- 't' -- Don't auto format my code. I got linters for that.
	+ 'c' -- In general, I like it when comments respect textwidth
	+ 'q' -- Allow formatting comments w/ gq
	- 'o' -- O and o, don't continue comments
	+ 'r' -- But do continue when pressing enter.
	+ 'n' -- Indent past the formatlistpat, not underneath it.
	+ 'j' -- Auto-remove comments if possible.
	- '2' -- I'm not in gradeschool anymore

-- invisiable characters
o.listchars = { trail = '•', nbsp = '⦸', tab = '-->' }
o.list = true

-- auto balance panes if window changes size
local augVimResize = vim.api.nvim_create_augroup('VimResize', { clear = true })
vim.api.nvim_create_autocmd('VimResized', {
	pattern = { '*' },
	group = augVimResize,
	callback = function()
		vim.schedule(function()
			vim.cmd([[:wincmd =]])
		end)
	end,
})
