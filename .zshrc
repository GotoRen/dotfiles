### zsh PATH
export PATH="/usr/local/sbin:$PATH"

### zi installer
autoload -U promptinit; promptinit

ZPLUGIN_HOME=$HOME/.zi

case ${OSTYPE} in
  darwin*)
    # Mac Setting
    ;;
  linux*)
    # LinuxBrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    ;;
esac

if [[ ! -f $ZPLUGIN_HOME/bin/zi.zsh ]]; then
  git clone https://github.com/z-shell/zi/ $ZPLUGIN_HOME/bin
fi

source $ZPLUGIN_HOME/bin/zi.zsh

autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

autoload -Uz add-zsh-hock
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook

### plugins
zi light 'zsh-users/zsh-autosuggestions'
zi light 'zsh-users/zsh-completions'
zi light 'zdharma/fast-syntax-highlighting'
zi light 'chrissicool/zsh-256color'
zi light 'paulirish/git-open'
zi light 'reegnz/jq-zsh-plugin'
zi light 'b4b4r07/emoji-cli'
zi light 'mollifier/anyframe'
zi light 'b4b4r07/enhancd'
zi load 'junegunn/fzf-bin'
zi load 'zdharma/history-search-multi-word'

####################################################
### commnad
###################################################@
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
alias sz='source ~/.zshrc'
alias rezsh='exec $SHELL -l'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='exa --icons -la -T --git --color=always --time-style=long-iso -L 1'
alias c='clear'

alias lg='lazygit'
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gg='git graph'
alias gm='git commit -m'
alias gp='git push'
alias gc='git clone'
alias gb='git branch'
alias gh='git checkout'

alias dp='docker ps'
alias di='docker images'
alias dn='docker network ls'
alias dv='docker volume ls'
alias dc='docker-compose'
alias didown='docker system prune --all'
alias dvdown='docker volume prune'

alias k='kubectl'
alias h='helm'

alias listen='lsof -i -P'
alias gcp='gcloud'
alias tf='terraform'
alias rfc='rfcbibtex'

####################################################
### version control
####################################################
### anyenv
#export PATH="$HOME/.anyenv/bin:$PATH"
#eval "$(anyenv init -)"

### nvm
source $(brew --prefix nvm)/nvm.sh

### asdf
. /usr/local/opt/asdf/libexec/asdf.sh

####################################################
### tools
####################################################
### iTerm2 Color
export CLICOLOR=1
export TERM=xterm-256color

### Starship
eval "$(starship init zsh)"

####################################################
### config
####################################################
### ls color
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=36:fi=37:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

### AWS profile
export AWS_PROFILE=awsGeneral-1

### GCP profile
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

### krew
export PATH="${PATH}:${HOME}/.krew/bin"

### kubectl
source <(kubectl completion zsh)

## antigen
if [[ -f $HOME/.zsh/antigen/antigen.zsh ]]; then
  source $HOME/.zsh/antigen/antigen.zsh
  antigen apply
fi
