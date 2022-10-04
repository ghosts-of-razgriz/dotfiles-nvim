local packer = require 'packer'
local utils = require 'utils'

packer.startup(function(use)
	-- packer manage itself
	use { 'wbthomason/packer.nvim' }

	-- color schemes
	use { 'folke/tokyonight.nvim', config = 'require "config.color"' }
end)
