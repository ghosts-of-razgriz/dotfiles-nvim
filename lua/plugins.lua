local packer = require('packer')

packer.startup(function(use)
  -- packer managing itself
  use {'wbthomason/packer.nvim', opt = true}

  -- color schemes
  use {
    'dracula/vim',
    as = 'dracula',
    config = function()
      vim.cmd('colorscheme dracula')
    end
  }
  use {'arcticicestudio/nord-vim', disable = true}
  use {'cocopon/iceberg.vim', disable = true}
  use {'joshdick/onedark.vim', disable = true}
end)

