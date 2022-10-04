-- map leader keys
vim.cmd [[let g:mapleader = "\<space>"]]
vim.cmd [[let g:maplocalleader = "\<c-space>"]]

-- initialize packer
require 'hass.packer'
require 'hass.plugins'
