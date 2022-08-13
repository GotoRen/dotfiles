####################################################
### version control
####################################################
### asdf
. /usr/local/opt/asdf/libexec/asdf.sh
eval "$(direnv hook zsh)"

### nvm
source $(brew --prefix nvm)/nvm.sh

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
source <(kustomize completion zsh)
source <(helm completion zsh)