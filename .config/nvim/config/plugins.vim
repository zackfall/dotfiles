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
let g:UltiSnipsExpandTrigger="<S-tab>"

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

" ==============================================================================
"     * Explorer *
" ==============================================================================
nmap <silent><space>a :20Lexplore!<cr>
let g:netrw_liststyle = 3

if !has('gui_running')
  set t_Co=256
endif

" ==============================================================================
"     * MarkdownPreview *
" ==============================================================================
nmap <silent> <F9> :MarkdownPreview<CR>
nmap <silent> <F10> :StopMarkdownPreview<CR>

" ==============================================================================
"     * ALE *
" ==============================================================================
nnoremap gd :ALEGoToDefinition<CR>
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'rust': ['rustfmt'],
      \ 'javascript': ['prettier'],
      \ 'javascriptreact': ['prettier'],
      \ 'python': ['black'],
      \ 'typescript': ['deno'],
      \ 'html': ['prettier'],
      \ 'json': ['prettier'],
      \ 'css': ['prettier'],
      \ 'vue': ['prettier']
\}
let g:ale_fix_on_save = 1
let g:ale_enabled = 0

" ==============================================================================
"     * DoGe *
" ==============================================================================
let g:doge_enable_mappings = 1

" ==============================================================================
"     * Python syntax highligth *
" ==============================================================================
let g:python_highlight_all = 1
