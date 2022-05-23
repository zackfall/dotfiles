call plug#begin('~/.config/nvim/plugged')
" Collection of common configuration for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Completion framework
Plug 'hrsh7th/nvim-cmp'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
" Other useful completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" Snippet engine
Plug 'hrsh7th/vim-vsnip'
" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kassio/neoterm'
" Color scheme
Plug 'joshdick/onedark.vim'
Plug 'rebelot/kanagawa.nvim'
" General purpose plugins
Plug 'tpope/vim-commentary'
Plug 'startup-nvim/startup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lervag/wiki.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'RRethy/vim-illuminate'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
" dev
Plug 'togglebyte/togglerust'
Plug 'airblade/vim-gitgutter'
Plug 'timonv/vim-cargo'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'github/copilot.vim'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
" syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'lepture/vim-jinja'
call plug#end()
