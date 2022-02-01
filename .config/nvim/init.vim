let &runtimepath.=",~/.config/nvim/plugged/neoterm"

au TermOpen * exec "normal G"
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/completion/config.vim
source $HOME/.config/nvim/general/config.vim
source $HOME/.config/nvim/general/keymaping.vim
source $HOME/.config/nvim/plugins-conf/config.vim
