#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Filesystem 
alias ..='cd ..'              # Go up one directory
alias ...='cd ../..'          # Go up two directories
alias ....='cd ../../..'      # Go up three directories
alias .....='cd ../../../..'  # And for good measure
alias l='ls -lah'             # Long view, show hidden
alias la='ls -AF'             # Compact view, show hidden
alias ll='ls -lFh'            # Long view, no hidden

# Remove unnecessary confirmation for rm -f
setopt rmstarsilent

# Turn off globbing for rm
alias rm='noglob rm'

# Helpers
alias grep='grep --color=auto' # Always highlight grep search term
alias df='df -h'            # Disk free, in gigabytes, not bytes
alias du='du -h -c'         # Calculate total disk usage for a folder
alias sgi='sudo gem install' # Install ruby stuff
alias clr='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."'
alias svim="sudo vim" # Run vim as super user

# Customize PATH
export PATH="$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:$HOME/.rvm/bin"

# GREP OPTIONS
export GREP_OPTIONS="-i --color=auto"

# HISTORY OPTIONS
export HISTSIZE=10000
export HISTTIMEFORMAT='%b %d %I:%M %p '
export HISTCONTROL=ignoreboth           # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls"

# Double [Esc] [Esc] for sudo
sudo-command-line() {
        [[ -z $BUFFER ]] && zle up-history
        [[ $BUFFER != sudo\ * ]] && LBUFFER="sudo $LBUFFER"
}
zle -N sudo-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey "\e\e" sudo-command-line
