"  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄
" ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
" ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀  ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀█░█▀▀▀▀
" ▐░▌          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌               ▐░▌     ▐░▌       ▐░▌     ▐░▌
" ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄      ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌     ▐░▌
" ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌     ▐░▌     ▐░░░░░░░░░░░▌     ▐░▌
" ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀█░█▀▀ ▐░▌       ▐░▌ ▀▀▀▀▀▀▀▀▀█░▌     ▐░▌     ▐░█▀▀▀▀█░█▀▀      ▐░▌
" ▐░▌          ▐░▌     ▐░▌  ▐░▌       ▐░▌          ▐░▌     ▐░▌     ▐░▌     ▐░▌       ▐░▌
" ▐░▌          ▐░▌      ▐░▌ ▐░█▄▄▄▄▄▄▄█░▌ ▄▄▄▄▄▄▄▄▄█░▌     ▐░▌     ▐░▌      ▐░▌  ▄▄▄▄█░█▄▄▄▄
" ▐░▌          ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌     ▐░▌       ▐░▌▐░░░░░░░░░░░▌
"  ▀            ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀       ▀       ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀
"
" -----------------------------------------------------------------------------
"     * Default settings *
" -----------------------------------------------------------------------------
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
set foldmethod=indent
set foldenable
set foldlevelstart=10
set foldnestmax=10
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
set mouse=
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

" -----------------------------------------------------------------------------
"     * Key bindings *
" -----------------------------------------------------------------------------
let mapleader = " "
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>fs :Files<cr>
noremap <leader>pi :PlugInstall<cr>
noremap <leader>pc :PlugClean<cr>
noremap <leader>n :tabe .<cr>
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>

" -----------------------------------------------------------------------------
"     * Errors / warnings *
" -----------------------------------------------------------------------------
nmap <leader>g :copen<CR>

" -----------------------------------------------------------------------------
"     * Resizing panes *
" -----------------------------------------------------------------------------
nmap <S-h> :vertical resize -4<CR>
nmap <S-l> :vertical resize +4<CR>
nmap <S-k> :resize +4<CR>
nmap <S-j> :resize -4<CR>

" -----------------------------------------------------------------------------
"     * Scratch buffer *
"     Create a new scrach buffer
" -----------------------------------------------------------------------------
function CreateScratchBuffer(vertical)
    if a:vertical == 1
        :vnew
    else
        :new
    endif
    :setlocal buftype=nofile
    :setlocal bufhidden=hide
    :setlocal noswapfile
    :set ft=scratch
endfunction
:command! Newvert call CreateScratchBuffer(1)
:command! Newhor call CreateScratchBuffer(0)
nmap <C-n> :Newvert<CR>
nmap <A-n> :Newhor<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -----------------------------------------------------------------------------
"     * Plugins *
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Colorscheme
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'savq/melange'

" Funtionalities

Plug 'godlygeek/tabular'                                 " For order lines
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }      " For Files search
Plug 'junegunn/fzf.vim'                                  " For Files search
Plug 'christoomey/vim-tmux-navigator'                    " Navigation between panes
Plug 'mattn/emmet-vim'                                   " Help for html
Plug 'iamcco/mathjax-support-for-mkdp'                   " Support for markdown preview
Plug 'iamcco/markdown-preview.vim'                       " For preview your markdown files
Plug 'luochen1990/rainbow'                               " Rainbow Parentheses
Plug 'lilydjwg/colorizer'                                " example #ffffff
Plug 'airblade/vim-gitgutter'                            " Just vim gitgutter
Plug 'itchyny/vim-gitbranch'                             " The branch name on the status line
Plug 'tpope/vim-surround'                                " Surround tags, quotes, etc.
Plug 'tpope/vim-commentary'                              " Comment text
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } } " Auto doc functions on some languages
Plug 'Vimjas/vim-python-pep8-indent'                     " ident for python
Plug 'Yggdroot/indentLine'                               " Ident line
Plug 'RRethy/vim-illuminate'                             " For see other words like the you are focusing
Plug 'dhruvasagar/vim-table-mode'                        " Create instant tables
Plug 'habamax/vim-godot'                                 " Use gdscript in vim
Plug 'rust-lang/rust.vim'                                " rust-syntax
Plug 'wesQ3/vim-windowswap'                              " For swap the position of a buffer
Plug 'SirVer/ultisnips'                                  " Snippets
Plug 'vimwiki/vimwiki'                                   " VimWiki
Plug 'dense-analysis/ale'                                " Asynchronous Lint Engine
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
call plug#end()

let g:python3_host_prog='/usr/bin/python3'

let g:rainbow_active = 1

" =============================================================================
"     * Fzf *
" =============================================================================
command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" =============================================================================
"     * Ale *
" =============================================================================
nnoremap gd :ALEGoToDefinition<CR>
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'rust': ['rustfmt'],
      \ 'javascript': ['prettier'],
      \ 'python': ['black'],
      \ 'typescript': ['prettier'],
      \ 'html': ['prettier'],
      \ 'css': ['prettier'],
      \ 'vue': ['prettier'],
      \ 'jsx': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_enabled = 0

" =============================================================================
"     * WindowSwap *
" =============================================================================
function! WindowSwapInDirection(dir)
  call WindowSwap#MarkWindowSwap()
  exec 'wincmd ' . a:dir
  call WindowSwap#DoWindowSwap()
endfunction

noremap <silent> <M-S-h> :call WindowSwapInDirection('h')<cr>
noremap <silent> <M-S-j> :call WindowSwapInDirection('j')<cr>
noremap <silent> <M-S-k> :call WindowSwapInDirection('k')<cr>
noremap <silent> <M-S-l> :call WindowSwapInDirection('l')<cr>

" -----------------------------------------------------------------------------
"     * Prettier *
" -----------------------------------------------------------------------------
nmap <Leader>pr <Plug>(Prettier)<cr>

" -----------------------------------------------------------------------------
"     * UltiSnips *
" -----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"

" -----------------------------------------------------------------------------
"     * Tab line *
" -----------------------------------------------------------------------------

if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= i
            if tabpagewinnr(i,'$') > 1
                let s .= '.'
                let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')
                let s .= (tabpagewinnr(i,'$') > 1 ? wn : '')
            end

            let s .= ' %*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= file
            let s .= (i == t ? '%m' : '')
            let i = i + 1
        endwhile
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif

if !has('gui_running')
  set t_Co=256
endif

" -----------------------------------------------------------------------------
"     * ColorScheme *
" -----------------------------------------------------------------------------
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum]"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum]"
  set termguicolors
endif
colorscheme spaceduck
" set background=light

" -----------------------------------------------------------------------------
"     * IndentLine *
" -----------------------------------------------------------------------------
let g:indentLine_color_term = 128
let g:indentLine_char = '▏'

" -----------------------------------------------------------------------------
"     * MarkdownPreview *
" -----------------------------------------------------------------------------
nmap <silent> <F9> :MarkdownPreview<CR>
nmap <silent> <F10> :StopMarkdownPreview<CR>

" -----------------------------------------------------------------------------
"     * json Comments *
" -----------------------------------------------------------------------------
autocmd FileType json syntax match Comment +\/\/.\+$+

" -----------------------------------------------------------------------------
"     * Emmet *
" -----------------------------------------------------------------------------
let g:user_emmet_leader_key=','

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" html
autocmd Filetype html,htm,htmldjango
      \ set expandtab
      \ | set shiftwidth=2
      \ | set tabstop=2
      \ | set softtabstop=4
      \ | set autoindent
      \ | set fileformat=unix

" javascript
augroup vimrc-javascript
  autocmd!
  autocmd Filetype javascript
        \ set expandtab
        \ | set shiftwidth=2
        \ | set tabstop=2
        \ | set softtabstop=4
        \ | set textwidth=100
        \ | set autoindent
        \ | set fileformat=unix
augroup END

" typescript
augroup vimrc-typescript
  autocmd!
  autocmd Filetype typescript
        \ set expandtab
        \ | set shiftwidth=2
        \ | set tabstop=2
        \ | set softtabstop=4
        \ | set textwidth=100
        \ | set autoindent
        \ | set fileformat=unix
augroup END

" Vue
augroup vimrc-vue
  autocmd!
  autocmd Filetype vue
        \ set expandtab
        \ | set shiftwidth=2
        \ | set tabstop=2
        \ | set softtabstop=4
        \ | set textwidth=100
        \ | set autoindent
        \ | set fileformat=unix
augroup END

" vim
augroup vimrc-vim
  autocmd!
  autocmd FileType vim
        \ set expandtab
        \ | set shiftwidth=2
        \ | set tabstop=2
        \ | set softtabstop=4
        \ | set textwidth=100
        \ | set autoindent
        \ | set fileformat=unix
augroup END
