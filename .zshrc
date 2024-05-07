# Exports
export PATH="/home/isaac/.cargo:$PATH"
export GPG_TTY=$(tty)

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"

# Aliases
alias v="nvim"
alias cat="bat"
alias la="ls -a"
alias lla="ls -la"
