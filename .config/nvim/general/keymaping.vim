" -----------------------------------------------------------------------------
"     * Key bindings *
" -----------------------------------------------------------------------------
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
"     * Errors / warnings *
" -----------------------------------------------------------------------------
" nnoremap <leader>g :copen<CR>
" nnoremap <leader>n :cnext<CR>
" nnoremap <leader>N :cprev<CR>

" ==============================================================================
"     * MarkdownPreview *
" ==============================================================================
nnoremap <silent> <F9> :MarkdownPreview<CR>
nnoremap <silent> <F10> :StopMarkdownPreview<CR>

" -----------------------------------------------------------------------------
"     * Scratch buffer *
"     Create a new scrach buffer
" -----------------------------------------------------------------------------
nnoremap <C-n> :vnew

" -----------------------------------------------------------------------------
"     * Terminal *
" -----------------------------------------------------------------------------
nnoremap <C-t> :call OpenTerm()<CR>
nnoremap <C-c> :Tclose<CR>
nnoremap <C-u> :Tclear<CR>

" ==============================================================================
"     * Code navigation *
" ==============================================================================
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

"==============================================================================
"     * Code Actions *
" ==============================================================================
nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR>

"==============================================================================
"     * Telescope *
" ==============================================================================
nnoremap <silent><leader>ff :Telescope find_files<CR>
nnoremap <silent><leader>bf :Telescope buffers<CR>
nnoremap <silent><leader>mn :Telescope man_pages<CR>
nnoremap <silent>ga :Telescope lsp_code_actions<CR>

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

xnoremap <A-q> :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
