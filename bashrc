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

kube_current_context()
{
    # Get current context
    CONTEXT=$(kubectl config current-context)

    if [ -n "$CONTEXT" ]; then
        echo "${CONTEXT}"
    fi
}

kcc()
{
    kube_current_context
}

gcp()
{
    parse_active_gcp_config
}

parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_active_gcp_config() {
    CONFIG=$(cat ~/.config/gcloud/active_config)

    if [ -n "$CONFIG" ]; then
        echo "${CONFIG}"
    fi
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

PS1="\[$reset\][\[$cyan\]\A\[$reset\]]\[$user_color\]\u\
\[$white\]:\[$cyan\]\w\[$reset\]\[$white\] \[$yellow\]\$(parse_git_branch)\[$reset\]\n$ "
