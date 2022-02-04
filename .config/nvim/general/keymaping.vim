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
nmap <C-A-h> :vertical resize -4<CR>
nmap <C-A-l> :vertical resize +4<CR>
nmap <C-A-k> :resize +4<CR>
nmap <C-A-j> :resize -4<CR>

" ==============================================================================
"     * Explorer *
" ==============================================================================
nmap <silent><space>a :Telescope file_browser file_browser<cr>

" -----------------------------------------------------------------------------
"     * Errors / warnings *
" -----------------------------------------------------------------------------
" nmap <leader>g :copen<CR>
" nmap <leader>n :cnext<CR>
" nmap <leader>N :cprev<CR>

" ==============================================================================
"     * MarkdownPreview *
" ==============================================================================
nmap <silent> <F9> :MarkdownPreview<CR>
nmap <silent> <F10> :StopMarkdownPreview<CR>

" -----------------------------------------------------------------------------
"     * Scratch buffer *
"     Create a new scrach buffer
" -----------------------------------------------------------------------------
nmap <C-n> :vnew

" -----------------------------------------------------------------------------
"     * Terminal *
" -----------------------------------------------------------------------------
nmap <C-t> :call OpenTerm()<CR>
nmap <C-c> :Tclose<CR>
nmap <C-u> :Tclear<CR>

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

" ==============================================================================
"     * Code Diagnostics *
" ==============================================================================
nnoremap <silent>gn <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent>gN <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

"==============================================================================
"     * Code Actions *
" ==============================================================================
nnoremap <silent> ga <cmd>lua vim.lsp.buf.code_action()<CR>

"==============================================================================
"     * Telescope *
" ==============================================================================
nmap <silent><leader>ff :Telescope find_files<CR>
nmap <silent><leader>bf :Telescope buffers<CR>
nmap <silent><leader>mn :Telescope man_pages<CR>
nmap <silent>ga :Telescope lsp_code_actions<CR>

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
