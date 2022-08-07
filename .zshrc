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

### anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

### nvm
source $(brew --prefix nvm)/nvm.sh

### iTerm2 Color
export CLICOLOR=1
export TERM=xterm-256color

### Starship
eval "$(starship init zsh)"

### AWS profile
export AWS_PROFILE=awsGeneral-1

### GCP profile
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

### lsカラー
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=36:fi=37:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

### alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias lg='lazygit'
alias ll='exa --icons -la -T --git --color=always --time-style=long-iso -L 1'
alias sz='source ~/.zshrc'
alias rezsh='exec $SHELL -l'
alias listen='lsof -i -P'
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
alias c='clear'
alias gcp='gcloud'
alias tf='terraform'

alias dp='docker ps'
alias di='docker images'
alias dn='docker network ls'
alias dv='docker volume ls'
alias dc='docker-compose'
alias didown='docker system prune --all'
alias dvdown='docker volume prune'

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

alias rfc='rfcbibtex'

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
