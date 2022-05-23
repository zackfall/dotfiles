if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent><leader>ff :Telescope find_files<CR>
nnoremap <silent><leader>bf :Telescope buffers<CR>
nnoremap <silent><leader>mn :Telescope man_pages<CR>
nnoremap <silent><space>a :Telescope file_browser file_browser<cr>

lua <<EOF
  require('telescope').setup{
    extensions = {
      file_browser = {
        theme = 'ivy'
      }
    },
    defaults = {
      mappings = {
        n = {
          ["q"] = require('telescope.actions').close
        }
      }
    }
  }
EOF
