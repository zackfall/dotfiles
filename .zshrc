# Created by newuser for 5.9

PS1='[%n@%m %~]$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# alias v="nvim"
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

# Install zoxide, starship, flatpak, rust, fnm, pyenv, pnpm, npiperelay para el discord presence, devkitpro, yazi, cargo-miri, cargo-shuttle, rls,rust-analyzer, rust-gdb- rust-lldb, shuttle
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS="/home/noir/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export PATH="~/.local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/home/noir/.cargo/bin:$PATH"
export PATH="/home/noir/.local/share/pnpm:$PATH"
export PATH="/mnt/c/Users/zackf/Documents/npiperelay:$PATH"
export PATH="opt/devkitpro/tools/bin/:$PATH"
export GPG_TYY=$(tty)
export EDITOR="vim"
export GIT_EDITOR="vim"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function v() {
    if ! pidof socat > /dev/null 2>&1; then
        [ -e /tmp/discord-ipc-0 ] && rm -f /tmp/discord-ipc-0
        socat UNIX-LISTEN:/tmp/discord-ipc-0,fork \
            EXEC:"npiperelay.exe //./pipe/discord-ipc-0" 2>/dev/null &
    fi

    if [ $# -eq 0 ]; then
        command nvim
    else
        command nvim "$@"
    fi
}

# fnm
FNM_PATH="/home/azrione/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/azrione/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="/home/azrione/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
