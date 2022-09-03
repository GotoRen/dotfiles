# alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"
alias brew="PATH=/opt/homebrew/bin:/usr/bin:/bin:/opt/homebrew/sbin:/usr/sbin:/sbin brew"

alias sz='source ~/.zshrc'
alias rezsh='exec $SHELL -l'
alias hi='history -30'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
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

alias al='asdf plugin list all'
alias k='kubectl'
alias h='helm'

alias listen='lsof -i -P'
alias gcp='gcloud'
alias tf='terraform'
alias rfc='rfcbibtex'
