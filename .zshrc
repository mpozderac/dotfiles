GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_STATESEPARATOR=""

source ~/dotfiles/shell/colors.sh
source ~/dotfiles/shell/git-prompt.sh

# Path to your oh-my-zsh installation.
export ZSH=~/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/dotfiles/oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/dotfiles/oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/dotfiles/oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z git node npm bower brew osx extract)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/dotfiles/oh-my-zsh"
alias tower=gittower
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lA'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'
alias mvim='mvim >& /dev/null'


# Functions
function fd() {
  echo -e "${Green}Searching for folder...$reset_color"
  find . -type d -iname "$1" -print 2>/dev/null
  echo -e "${Green}Done$reset_color"
}
function ff() {
  echo -e "${Green}Searching for file...$reset_color"
  find . -type f -iname "$1" -print 2>/dev/null
  echo -e "${Green}Done$reset_color"
}

# Prompt setup
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_pwd() {
  print -D $PWD
}

function precmd () {
__git_ps1 "
%{$bg[cyan]%}%{$fg[black]%} %n@%m %{$reset_color%} %D{%F %T %Z}
%{$bg[yellow]%}%{$fg[black]%} $(get_pwd) %{$reset_color%}
%{$reset_color%}" "$ " "%s "
}

# iTerm2 integration
source ~/dotfiles/.iterm2_shell_integration.zsh

# Simpler command history nav.
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

export MSDK_HOME=/www/html/localhost-tools/paymentech-sdk/JPMC_MSDK_1.0.0
export JAVA_HOME=/Library/Java/Home
export MSDK_LOG_DIR=/www/log