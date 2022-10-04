-- map leader keys
vim.cmd [[let g:mapleader = "\<space>"]]
vim.cmd [[let g:maplocalleader = "\<c-space>"]]

-- initialize packer
require 'hass.init-packer'
require 'hass.plugins'
