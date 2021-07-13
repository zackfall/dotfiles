" rust settings

" =============================================================================
"     * General settings *
" =============================================================================

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set textwidth=99
set autoindent
set fileformat=unix
set makeprg=cargo

" =============================================================================
"     * Key mapping *
" =============================================================================

nmap <leader>c :Cargo check<CR>
nmap <F5> :Cargo run<CR>
nmap <leader>b :Compile<CR>
nmap <leader>f :RustFmt<CR>
nmap <leader>t :Cargo test -- --nocapture<CR>
nmap <leader>T :!env RUST_BACKTRACE=1 cargo test -- --nocapture<CR>
nmap <F6> :call RunDebugger()<CR>
