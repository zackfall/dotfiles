# Created by newuser for 5.9

PS1='[%n@%m %~]$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
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
export XDG_DATA_DIRS="/home/rion/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export PATH="~/.local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/home/rion/.cargo/bin:$PATH"
export PATH="/home/rion/.local/share/pnpm:$PATH"
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
    # Check if socat process for discord IPC is running
    if ! pgrep -f "discord-ipc-0" > /dev/null 2>&1; then
        [ -e /tmp/discord-ipc-0 ] && rm -f /tmp/discord-ipc-0
        socat UNIX-LISTEN:/tmp/discord-ipc-0,fork \
            EXEC:"npiperelay.exe //./pipe/discord-ipc-0" 2>/dev/null &
        # Give socat a moment to create the socket
        sleep 0.5
    fi

    if [ $# -eq 0 ]; then
        command nvim
    else
        command nvim "$@"
    fi
}

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"
export PATH="/run/user/1000/fnm_multishells/743_1751410464832/bin":$PATH
export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/743_1751410464832"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/home/rion/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="true"
export FNM_ARCH="x64"
rehash

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
eval "$(pyenv virtualenv-init - zsh)"

# pnpm
export PNPM_HOME="/home/rion/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export EDITOR=nvim
alias v="nvim"
alias vim="nvim"
