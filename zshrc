# Path modifications
source $HOME/.zsh_path

export MANPATH="/usr/local/man:$MANPATH"

# Online help for zsh
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

source $HOME/.zsh_aliases

# oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"
SOLARIZED_THEME="light"

DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=6

COMPLETION_WAITING_DOTS="true"

plugins=(tmux osx brew sudo git autojump last-working-dir)

# For tmux plugin
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_FIXTERM=false
DISABLE_AUTO_TITLE=true # Don't force auto-titling of tmux windows

source $ZSH/oh-my-zsh.sh
