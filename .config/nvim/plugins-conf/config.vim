" ==============================================================================
"     * Plungins configuration *
" ==============================================================================

" ==============================================================================
"     * IndentLine *
" ==============================================================================
let g:indentLine_char_list = ['·']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" ==============================================================================
"     * Emmet *
" ==============================================================================
let g:user_emmet_leader_key=','

" ==============================================================================
"     * UltiSnips *
" ==============================================================================
" let g:UltiSnipsExpandTrigger="<S-tab>"

" ==============================================================================
"     * Closetag *
" ==============================================================================
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,vue,javascriptreact,typescriptreact'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" =============================================================================
"     * Fzf *
" =============================================================================
command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

if !has('gui_running')
  set t_Co=256
endif

" ==============================================================================
"     * DoGe *
" ==============================================================================
let g:doge_enable_mappings = 1

" ==============================================================================
"     * Python syntax highligth *
" ==============================================================================
let g:python_highlight_all = 1

" ==============================================================================
"     * Diagnostics *
" ==============================================================================
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float()

" Format on write
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
