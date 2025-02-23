# Created by newuser for 5.9

PS1='[%n@%m %~]$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v="nvim"
alias btop="bpytop"
alias ls="exa -g --icons"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias cat="bat"
alias reload-wb="pkill waybar && hyprctl dispatch exec waybar"

eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS="/home/noir/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export PATH="~/.local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/home/noir/.cargo/bin:$PATH"
export GPG_TYY=$(tty)
export EDITOR="nvim"
export GIT_EDITOR="nvim"
# pnpm
export PNPM_HOME="/home/noir/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
