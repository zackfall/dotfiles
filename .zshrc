# Source antidote
source /home/isaac/.antidote/antidote.zsh

autoload -Uz compinit
compinit
zmodload -i zsh/complist

antidote load

source /usr/share/doc/pkgfile/command-not-found.zsh

# Exports
export PATH="/home/isaac/.cargo:$PATH"
export GPG_TTY=$(tty)

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Aliases
alias v="nvim"
alias cat="bat"
alias ls="exa -g --icons"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
