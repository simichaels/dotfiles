# oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
#ZSH_THEME="blinks"
#SOLARIZED_THEME="light" # For blinks

DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=6

COMPLETION_WAITING_DOTS="true"

plugins=(osx brew sudo git autojump last-working-dir)

source $ZSH/oh-my-zsh.sh

# Path modifications
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:"        # The usual
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"  # Standard homebrew paths
export PATH="/usr/local/opt/ruby/bin:$PATH"         # Ruby gems for homebrew
export PATH="$(brew --prefix sqlite)/bin:$PATH"     # Use brew's newer sqlite

export MANPATH="/usr/local/man:$MANPATH"

 Use vim when over SSH, MacVim otherwise
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Online help for zsh
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

source $HOME/.zsh_aliases
