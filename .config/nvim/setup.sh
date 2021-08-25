#!/bin/bash

# This configuration was taken from here: https://github.com/togglebyte/nvim/blob/main/setup.sh
# I just modified some little things

# List of the package to install.
# Each package have to be in github.
PACKAGES=(
  # Theme
  "ayu-theme/ayu-vim"
  # General purpose
  "neovim/nvim-lspconfig"
  "sirver/UltiSnips"
  "tpope/vim-commentary"
  "tpope/vim-surround"
  "junegunn/fzf.vim"
  "christoomey/vim-tmux-navigator"
  "Yggdroot/indentLine"
  "RRethy/vim-illuminate"
  "iamcco/mathjax-support-for-mkdp"
  "iamcco/markdown-preview.vim"
  "matze/vim-move"
  "jiangmiao/auto-pairs"
  # dev
  "togglebyte/togglerust"
  "airblade/vim-gitgutter"
  "kkoomen/vim-doge"
  "dense-analysis/ale"
  "Vimjas/vim-python-pep8-indent"
  "mattn/emmet-vim"
  "alvan/vim-closetag"
  # syntax highlight
  "rust-lang/rust.vim"
  "vim-python/python-syntax"
  "HerringtonDarkholme/yats.vim"
  "pangloss/vim-javascript"
  "evanleck/vim-svelte"
  "posva/vim-vue"
)

if [[ $1 == "--init" ]]
then
  # Create the pack/dev/start directory
  # and clone all the plugins into it
  mkdir -p pack/dev/start
  cd pack/dev/start
  for package in "${PACKAGES[@]}"
  do
    git clone "https://github.com/$package"
  done
else
  # Git pull every package in pack/dev/start
  for package in `ls pack/dev/start`
  do
    path="pack/dev/start/$package"
    echo "Updating $package..."
    (cd $path && git pull)
  done
fi
