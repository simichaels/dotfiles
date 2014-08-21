# Path modifications
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:"        # The usual
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"  # Standard homebrew paths
export PATH="/usr/local/opt/ruby/bin:$PATH"         # Ruby gems for homebrew

export MANPATH="/usr/local/man:$MANPATH"

# Online help for zsh
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

source $HOME/.zsh_aliases

# This fixes backspace screwing up in vim + tmux
stty erase "^?"

# oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
#ZSH_THEME="blinks"
#SOLARIZED_THEME="light" # For blinks

DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=6

COMPLETION_WAITING_DOTS="true"

plugins=(tmux osx brew sudo git autojump last-working-dir)

# For tmux plugin
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=true
ZSH_TMUX_FIXTERM=false

source $ZSH/oh-my-zsh.sh
