if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Init jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

export GOPATH=~/projects/go
export GOBIN=~/projects/go/bin
export PATH=$GOPATH/bin:$PATH

# CLICOLOR and LSCOLORS set the color scheme for ls command
export CLICOLOR=1 
export LSCOLORS=GxFxCxDxBxegedabagaced

# used to add current get branch to prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set up prompt - don't add anything below here
reset=$(tput sgr0)
bold=$(tput bold)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
user_color=$green

[ "$UID" -eq 0 ] && { user_color=$red; }

PS1="\[$reset\][\[$cyan\]\A\[$reset\]]\[$user_color\]\u@\h\
\[$white\]:\[$cyan\]\w\[$reset\]\[$yellow\]\$(parse_git_branch)\[$reset\][\[$white\]\$?\[$reset\]]\[$white\]\
\\n\$\[$reset\] "
