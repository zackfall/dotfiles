" python settings

" =============================================================================
"     * General settings *
" =============================================================================

set expandtab
set shiftwidth=4
set tabstop=4
set colorcolumn=79
set textwidth=0
set nospell
set nosmartindent
set softtabstop=4
set cinwords=if,elif,else,for,while,try,except,finally,def,class,with
set autoindent
set fileformat=unix
set makeprg=pyright
let python_highlight_all = 1

autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-0_]+\ze(\[|\s|$|.\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
augroup python_syntax_extra
  autocmd!
  autocmd! Syntax python :syn keyword Operator self
augroup END

autocmd BufWritePre * %s/\s\+$//e

" =============================================================================
"     * Key mapping *
" =============================================================================
nmap <F5> :!python %<CR>
