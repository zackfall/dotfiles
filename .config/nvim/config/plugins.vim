" ==============================================================================
"     * Plungins configuration *
" ==============================================================================

" ==============================================================================
"     * Rainbow *
" ==============================================================================
let g:rainbow_active = 1

" ==============================================================================
"     * Wiki *
" ==============================================================================
let g:wiki_root = '~/wiki'
let g:wiki_toc_title = 'Table of Content'
let g:wiki_filetypes = ['md', 'wiki']
let g:wiki_link_target_type = 'md'
let g:wiki_link_extension = '.md'
" Create or Open a page with the WikiOpen command
let g:wiki_map_create_page = 'CreatePage'

function CreatePage(name) abort
  let l:name = wiki#get_root() . '/' . a:name
  " If the file is new, then append the current date
  return filereadable(l:name)
        \ ? a:name
        \ : a:name . '_' . strftime('%Y-%m-%d')
endfunction

" =============================================================================
"     * Fzf *
" =============================================================================
command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" ==============================================================================
"     * Explorer *
" ==============================================================================
nmap <silent><space>a :20Lexplore!<cr>
let g:netrw_liststyle = 3

" ==============================================================================
"     * ALE *
" ==============================================================================
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

" ==============================================================================
"     * UltiSnips *
" ==============================================================================
let g:UltiSnipsExpandTrigger="<tab>"

if !has('gui_running')
  set t_Co=256
endif

" ==============================================================================
"     * MarkdownPreview *
" ==============================================================================
nmap <silent> <F9> :MarkdownPreview<CR>
nmap <silent> <F10> :StopMarkdownPreview<CR>

" ==============================================================================
"     * Coc *
" ==============================================================================
" Show doc
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ==============================================================================
"     * DoGe *
" ==============================================================================
let g:doge_enable_mappings = 1

" ==============================================================================
"     * Python syntax highligth *
" ==============================================================================
let g:python_highlight_all = 1
