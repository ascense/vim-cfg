vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer self-update
  use 'wbthomason/packer.nvim'

  -- Denops
  use 'vim-denops/denops.vim'

  -- Theme & Powerline
  use 'chriskempson/base16-vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use { 'airblade/vim-gitgutter', branch = 'main' }
  use 'majutsushi/tagbar'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'm-pilia/vim-ccls'
  use 'simrat39/rust-tools.nvim'

  -- Debugger
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'

  -- Syntax
  use 'cespare/vim-toml'

  -- Autocompletion
  use 'Shougo/ddc.vim'
  use 'Shougo/ddc-ui-native'
  use 'matsui54/denops-popup-preview.vim'
  use 'matsui54/denops-signature_help'

  -- Autocompletion: Sources
  use 'Shougo/ddc-source-nvim-lsp'
  use 'Shougo/ddc-source-around'
  use 'Shougo/ddc-source-zsh'
  use 'matsui54/ddc-buffer'

  -- Autocompletion: Filters
  use 'tani/ddc-fuzzy'

  -- NerdTree
  use 'scrooloose/nerdtree'
  use 'ryanoasis/vim-devicons'

  -- RipGrep integration (ack.vim)
  use 'mileszs/ack.vim'

  -- Hexmode
  use 'fidian/hexmode'
end)
