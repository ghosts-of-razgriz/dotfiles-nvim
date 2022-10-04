local packer = require('packer')

packer.startup(function(use)
  -- packer managing itself
  use {
    'wbthomason/packer.nvim',
    opt = true,
  }

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

  -- plugins
  use {'sheerun/vim-polyglot'}
  use {'kana/vim-operator-user'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-surround'}
  use {
    'junegunn/vim-peekaboo',
    config = function()
      vim.g.peekaboo_window = 'vertical botright 80new'
    end
  }

  -- lazy plugins
  use {
    'Shougo/deoplete.nvim',
    config = function()
      vim.call('deoplete#enable')
    end,
    event = "InsertEnter *",
    run = ":UpdateRemotePlugins",
    requires = {
      'Shougo/context_filetype.vim',
      'Shougo/deoplete-lsp',
      {
        'neovim/nvim-lspconfig',
        config = function()
          require 'packer.lsp'
        end
      }
    }
  }

  use {
    'Shougo/denite.nvim',
    cmd = 'Denite',
    config = function()
      require 'packer.denite'
    end,
    setup = function()
      local settings = {  noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<leader>uu', ':Denite file/rec<cr>', settings)
      vim.api.nvim_set_keymap('n', '<localleader>uu', ':Denite directory_rec<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>ub', ':Denite buffer<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>ur', ':Denite -resume<cr>', settings)
      vim.api.nvim_set_keymap('n', '<leader>uh', ':Denite help<cr>', settings)
    end
  }

  use {
    'Shougo/defx.nvim',
    cmd = 'Defx',
    config = function()
      require 'packer.defx'
    end,
    setup = function()
      local settings = {  noremap = true, silent = true }
      vim.api.nvim_set_keymap('n', '<leader>e', ':Defx -buffer-name=defx -show-ignored-files<cr>', settings)
      vim.api.nvim_set_keymap('n', '<localleader>e', ":Defx -buffer-name=defx -show-ignored-files `expand('%:p:h')`<cr>", settings)
    end,
    requires = {'kristijanhusak/defx-git', {
        'kristijanhusak/defx-icons'
    }}
  }
end)

