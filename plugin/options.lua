-- neovim settings --------------------------------------------------------------------------------
local opt = vim.opt
local config_path = vim.fn.stdpath 'config'

opt.encoding = 'utf8'

opt.mouse = '' -- disable mouse support

-- tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- line numbering
opt.number = true
opt.relativenumber = true

opt.inccommand = 'split' -- live preview sub

opt.scrolloff = 5 -- show lines above and below cursor

-- new split rules
opt.splitbelow = true
opt.splitright = true

-- nicer diff view
opt.diffopt = opt.diffopt + 'iwhite' + 'vertical'

opt.virtualedit = 'block' -- visual block can select empty space

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.wrapscan = true
opt.showmatch = true
opt.hidden = false
opt.cursorline = true
opt.equalalways = false
opt.updatetime = 1000

opt.termguicolors = true

opt.conceallevel = 1

-- auto balance panes if window changes size
vim.cmd [[autocmd VimResized * :wincmd =]]

-- persistent undo
local undodir = config_path .. '/tmp/undo'
opt.undodir = undodir
opt.undofile = true

-- swap file directory
local swapdir = config_path .. '/tmp/swap//'
opt.directory = swapdir
opt.swapfile = true

-- floating popup menu
opt.pumblend = 17
opt.pumheight = 15
opt.pumwidth = 20

opt.formatoptions = opt.formatoptions
	- 'a' -- Auto formatting is BAD.
	- 't' -- Don't auto format my code. I got linters for that.
	+ 'c' -- In general, I like it when comments respect textwidth
	+ 'q' -- Allow formatting comments w/ gq
	- 'o' -- O and o, don't continue comments
	+ 'r' -- But do continue when pressing enter.
	+ 'n' -- Indent past the formatlistpat, not underneath it.
	+ 'j' -- Auto-remove comments if possible.
	- '2' -- I'm not in gradeschool anymore
