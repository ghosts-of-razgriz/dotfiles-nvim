local packer = require('packer')

packer.startup(function(use)
  -- packer managing itself
  use {'wbthomason/packer.nvim', opt = true}

  -- Experimental
  -- use {
  --   'akinsho/nvim-bufferline.lua',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons',
  --     config = function()
  --       require'nvim-web-devicons'.setup {
  --         default=true;
  --       }
  --     end,
  --   }
  -- }
  use {
    'glepnir/galaxyline.nvim',
    config = "require 'packer.config.galaxyline'",
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- color schemes
  use {'dracula/vim', as = 'dracula', config = "vim.cmd('colorscheme dracula')"}
  -- use {'arcticicestudio/nord-vim', config = "vim.cmd('colorscheme nord')"}
  -- use {'cocopon/iceberg.vim', config = "vim.cmd('colorscheme iceberg')"}
  -- use {'joshdick/onedark.vim', config = "vim.cmd('colorscheme onedark')"}
  -- use {'rakr/vim-one', config = "vim.cmd('colorscheme one')"}

  -- plugins
  use {'sheerun/vim-polyglot'}
  use {'kana/vim-operator-user'}
  use {'tpope/vim-repeat'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-surround'}
  use {
    'junegunn/vim-peekaboo',
    config = "vim.g.peekaboo_window = 'vertical botright 80new'",
  }
  use {'AndrewRadev/splitjoin.vim'}

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
  
  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = {
  --     {'nvim-lua/popup.nvim'},
  --     {'nvim-lua/plenary.nvim'},
  --   }
  -- }

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

  use {'cohama/lexima.vim', event = 'InsertEnter *', disable = true}
  use {'jiangmiao/auto-pairs', event = 'InsertEnter *'}
  use {'godlygeek/tabular', cmd = {'Tab', 'Tabularize'}}
  use {
    'tpope/vim-fugitive',
    cmd = {
      'Gblame',
      'Gcommit',
      'Gdiff',
      'Gedit',
      'Gfetch',
      'Git',
      'Gpull',
      'Gpush',
      'Gstatus',
      'Gwrite',
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

  use {
    'nvim-treesitter/nvim-treesitter',
    ft = {
      'bash',
      'c',
      'css',
      'go',
      'javascript',
      'lua',
      'python',
      'ruby',
      'toml',
      'yaml',
    },
    config = function()
      require 'nvim-treesitter.configs'.setup{
        ensure_installed = {
          'bash',
          'c',
          'css',
          'go',
          'javascript',
          'lua',
          'python',
          'ruby',
          'toml',
          'yaml',
        },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gji",
            node_incremental = "gjj",
            scope_incremental = "gjg",
            node_decremental = "gjk",
          },
        },
      }
    end
  }

  -- filetype plugins
  -- html
  use {
    'mattn/emmet-vim',
    cmd = 'EmmetInstall',
    ft = {
      'html',
      'css',
      'scss',
      'javascript.jsx',
      'javascript',
      'jsx',
      'eruby',
      'gohtmltmpl',
      'gohtml',
    },
  }

  -- javascript
  use {'pangloss/vim-javascript', ft = 'javascript', disable = true}
  use {'mxw/vim-jsx', ft = 'javascript', config = "vim.g.jsx_ext_required = 0"}
  use {
    'laughingman-hass/vim-prettier',
    cmd = 'PrettierAsync',
    ft = {
      'javascript',
      'jsx',
      'javascript.jsx',
      'typescript',
      'css',
      'less',
      'scss',
      'json',
      'graphql',
    },
    run = 'yarn install',
  }

  -- json
  use {'elzr/vim-json', ft = 'json'}
end)
