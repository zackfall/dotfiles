" ==============================================================================
"     * General Settings *
" ==============================================================================

syn keyword Todo TODO DONE READY HACK

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ==============================================================================
"     * ColorScheme *
" ==============================================================================
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
  set termguicolors
endif
colorscheme ayu
" Depends the colorscheme you use, uncomment this
" set background=light

" =============================================================================
"     * Default settings *
" =============================================================================
set nopreviewwindow
set fillchars+=vert:│
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set ignorecase
set incsearch
set smartcase
set smartindent
set wildmenu
set wildmode=full
set noruler
set backspace=indent,eol,start
set ttyfast
set laststatus=0
set splitright
set splitbelow
set wrap
set nohlsearch
set noswapfile
set ttimeoutlen=10
set colorcolumn=110
set nosmd
set hidden
set mouse=a
set clipboard=unnamedplus	" Keep what you copy on the clip-board
set matchpairs+=<:>
set autoread
au FocusGained,BufEnter * checktime
let g:rehash256 = 1
set encoding=UTF-8
set viminfo='100,<9999,s100
set showmatch
set sw=2
set fillchars+=vert:\
set nobackup
set nowritebackup
set updatetime=300
set wildignore+=*/target/*,*/tmp/*,*.swp,*.pyc,*__pycache__/*
set list
set listchars=eol:$,tab:>-,trail:·,extends:>,precedes:<
set showmode

" Set block cursor
set guicursor=i:block

" -----------------------------------------------------------------------------
"     * Key bindings *
" -----------------------------------------------------------------------------
let mapleader = " "
noremap <leader>fs :Files<cr>
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>

" -----------------------------------------------------------------------------
"     * Errors / warnings *
" -----------------------------------------------------------------------------
nmap <leader>g :copen<CR>
nmap <leader>n :cnext<CR>
nmap <leader>N :cprev<CR>

" -----------------------------------------------------------------------------
"     * Scratch buffer *
"     Create a new scrach buffer
" -----------------------------------------------------------------------------
nmap <C-n> :vnew
nmap <A-n> :new

" ==============================================================================
"     * Remember the last position of the cursor *
" ==============================================================================
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" ==============================================================================
"     * Debugging *
" ==============================================================================
packadd termdebug

" ==============================================================================
"     * Python envs config *
" ==============================================================================
let g:python3_host_prog='/usr/bin/python3'
" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
exec(open(activate_this).read(), { "__file__": activate_this })
EOF
    endif
endfunction

let defaultvirtualenv = $VIRTUAL_ENV

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if !empty(defaultvirtualenv) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif
