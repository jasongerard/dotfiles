if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

export GOPATH=~/projects/go
export CLICOLOR=1 
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=$GOPATH/bin:$PATH

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

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
\[$white\]:\[$blue\]\w\[$reset\]\[$yellow\]\$(parse_git_branch)\[$reset\][\[$white\]\$?\[$reset\]]\[$white\]\
\\n\$\[$reset\] "
