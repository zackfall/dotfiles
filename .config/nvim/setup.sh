#!/bin/bash

# This configuration was taken from here: https://github.com/togglebyte/nvim/blob/main/setup.sh
# I just modified some little things

# List of the package to install.
# Each package have to be in github.
PACKAGES=(
  "pineapplegiant/spaceduck"
  "ayu-theme/ayu-vim"
  "neovim/nvim-lspconfig"
  "sirver/UltiSnips"
  "tpope/vim-commentary"
  "tpope/vim-surround"
  "togglebyte/togglerust"
  "junegunn/fzf.vim"
  "christoomey/vim-tmux-navigator"
  "luochen1990/rainbow"
  "lilydjwg/colorizer"
  "airblade/vim-gitgutter"
  "kkoomen/vim-doge"
  "Vimjas/vim-python-pep8-indent"
  "Yggdroot/indentLine"
  "RRethy/vim-illuminate"
  "wesQ3/vim-windowswap"
  "lervag/wiki.vim"
  "dense-analysis/ale"
  "vim-python/python-syntax"
  "neoclide/coc.nvim"
  "iamcco/mathjax-support-for-mkdp"
  "iamcco/markdown-preview.vim"
  "sheerun/vim-polyglot"
  "rust-lang/rust.vim"
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
