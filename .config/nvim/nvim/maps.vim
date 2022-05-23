noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

let mapleader = " "
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" buffer resizing
nnoremap <C-A-h> :vertical resize -4<CR>
nnoremap <C-A-l> :vertical resize +4<CR>
nnoremap <C-A-k> :resize +4<CR>
nnoremap <C-A-j> :resize -4<CR>

" ==============================================================================
"     * Explorer *
" ==============================================================================
nnoremap <silent><space>a :Telescope file_browser file_browser<cr>

" -----------------------------------------------------------------------------
"     * Terminal *
" -----------------------------------------------------------------------------
nnoremap <C-t> :call OpenTerm()<CR>
nnoremap <C-c> :Tclose<CR>
nnoremap <C-u> :Tclear<CR>

xnoremap <A-q> :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
