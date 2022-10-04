local packer = require('packer')

packer.startup(function(use)
  -- packer managing itself
  use {'wbthomason/packer.nvim', opt = true}

  -- color schemes
  use {'dracula/vim', as = 'dracula', config = "vim.cmd('colorscheme dracula')"}
  use {'arcticicestudio/nord-vim', disable = true}
  use {'cocopon/iceberg.vim', disable = true}
  use {'joshdick/onedark.vim', disable = true}

  -- plugins
  use {'sheerun/vim-polyglot'}
  use {'kana/vim-operator-user'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-surround'}
  use {'junegunn/vim-peekaboo', config = "vim.g.peekaboo_window = 'vertical botright 80new'"}

  -- lazy plugins
  use {
    'Shougo/deoplete.nvim',
    config = "vim.call('deoplete#enable')",
    event = "InsertEnter *",
    requires = {
      'Shougo/context_filetype.vim',
      'Shougo/deoplete-lsp',
      {'neovim/nvim-lspconfig', config = "require 'packer.config.lsp'"}
    }
  }

  use {
    'Shougo/denite.nvim',
    cmd = 'Denite',
    config = "require 'packer.config.denite'",
    setup = "require 'packer.setup.denite'",
  }

  use {
    'Shougo/defx.nvim',
    cmd = 'Defx',
    config = "require 'packer.config.defx'",
    setup = "require 'packer.setup.defx'",
    requires = {'kristijanhusak/defx-git', {
        'kristijanhusak/defx-icons',
        config = "require 'packer.config.defx-icons'",
    }}
  }

  use {'jiangmiao/auto-pairs', event = 'InsertEnter *'}
  use {'godlygeek/tabular', cmd = {'Tab', 'Tabularize'}}
  use {
    'tpope/vim-fugitive',
    cmd = {
      'Gblame', 'Gcommit', 'Gdiff', 'Gedit', 'Gfetch', 'Git', 'Gpull', 'Gpush',
      'Gstatus', 'Gwrite'
    },
    setup = "require 'packer.setup.fugitive'",
  }

  use {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious'
    },
    setup = "require 'packer.setup.vim-tmux-navigator'"
  }

  use {'christoomey/vim-system-copy', keys = {'cp', 'cP'}}

  use {
    'janko-m/vim-test',
    cmd = {
      'TestNearest',
      'TestFile',
      'TestSuite',
      'TestLast',
      'TestVisit'
    },
    requires = {{
        'christoomey/vim-tmux-runner',
        cmd = {
          'VtrSendCommandToRunner',
          'VtrSendLinesToRunner',
          'VtrOpenRunner',
          'VtrKillRunner',
          'VtrFocusRunner',
          'VtrResizeRunner',
          'VtrReorientRunner',
          'VtrDetachRunner',
          'VtrReattachRunner',
          'VtrClearRunner',
          'VtrFlushCommand',
          'VtrSendCtrlD',
          'VtrSendFile',
          'VtrSendCommand',
          'VtrAttachToPane'
        }
    }}
  }
end)
