vim.g.mapleader = ' '
vim.cmd([[let g:maplocalleader = "\<c-space>"]])

local leader = '<leader>'
local localleader = '<localleader>'

local u = require('laughingman.utils')

u.nmap({ leader .. 'q', u.mapcmd('quit'), true })
u.nmap({ leader .. 'w', u.mapcmd('write'), true })
u.nmap({ leader .. 'h', u.mapcmd('set hlsearch!'), true })
u.nmap({ leader .. '-', u.mapcmd('wincmd _') .. u.mapcmd('wincmd |'), true })
u.nmap({ leader .. leader .. 'f', u.mapcmd('luafile %'), true })

u.nmap({ localleader .. 'q', u.mapcmd('quit!'), true })
u.nmap({ localleader .. 'a', u.mapcmd('quitall!'), true })
u.nmap({ localleader .. '\\', u.mapcmd('vsplit'), true })
u.nmap({ localleader .. '-', u.mapcmd('split'), true })
u.nmap({ localleader .. '<tab>', u.mapcmd('tabnew'), true })
u.nmap({ localleader .. 'h', u.mapcmd('tabprevious'), true })
u.nmap({ localleader .. 'l', u.mapcmd('tabnext'), true })

u.imap({ 'jk', '<esc>', true })
