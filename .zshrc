# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/isaachmi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  bgnotify
  deno
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=es_ES.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias grep='grep --color=auto'
alias ls='exa --group-directories-first'
alias l='exa -la'
alias tree='exa -T'
alias cls='tput reset'
alias exdevreq='poetry export --without-hashes --dev -f requirements.txt --output dev-requirements.txt'
alias exreq='poetry export --without-hashes -f requirements.txt --output requirements.txt'
alias ports="sudo lsof -i -P -n"
alias update="sudo pacman -Syu"
alias add="sudo pacman -S"
alias updateAur="paru -Syu"
alias playground="cd ~/learning/playground/ && nvim src/main.rs"


# Shortcuts
reset_widget() { tput reset; builtin zle .redisplay; }
zle -N reset_widget
bindkey "^L" reset_widget

# exports
export PATH=$PATH:/home/isaachmi/.local/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/home/isaachmi/.deno/bin/
export PATH=$PATH:/home/isaachmi/go/bin/
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
export PATH="~/Qt/5.14.0/gcc_64/bin:$PATH"
export PATH="$HOME/virtualenvs/bin:$PATH"
export LD_LIBRARY_PATH="~/Qt/5.14.0/gcc_64/lib:$PATH"
export TERM=xterm-256color

export POETRY_HOME=/home/isaachmi/virtualenvs/envs/

# Spotify data
export SPOTIPY_CLIENT_ID="a28858d8bf8640b0b0038672cf5c7e87"
export SPOTIPY_CLIENT_SECRET="1ee307f2bdf2459c9bb8ed6f29e6aa43"

# Starship prompt
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/isaachmi/google-cloud-sdk/path.zsh.inc' ]; then . '/home/isaachmi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/isaachmi/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/isaachmi/google-cloud-sdk/completion.zsh.inc'; fi

# Fetch master 6000
~/fm6000 -dog -o IsaacOS -n -m 25 -g 4 -l 35
source `which activate.sh`
