####################################################
### version control
####################################################
### asdf
. /usr/local/opt/asdf/libexec/asdf.sh

### nvm
source $(brew --prefix nvm)/nvm.sh

####################################################
### tools
####################################################
export CLICOLOR=1
export TERM=xterm-256color

eval "$(starship init zsh)"

eval "$(direnv hook zsh)"
export DIRENV_WARN_TIMEOUT=50s

####################################################
### config
####################################################
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=36:fi=37:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

export AWS_PROFILE=awsGeneral-1

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export PATH="${PATH}:${HOME}/.krew/bin"

source <(kubectl completion zsh)
source <(kustomize completion zsh)
source <(helm completion zsh)
