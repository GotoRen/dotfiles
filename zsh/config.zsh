####################################################
### version control
####################################################
# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# nvm
source $(brew --prefix nvm)/nvm.sh

####################################################
### config
####################################################
export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=36:fi=37:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

####################################################
### tools
####################################################
# starship
eval "$(starship init zsh)"

# direnv
eval "$(direnv hook zsh)"
export DIRENV_WARN_TIMEOUT=50s

# aws
export AWS_PROFILE=default

# gcp
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# k8s
export PATH="${PATH}:${HOME}/.krew/bin"
export KUBECTL_EXTERNAL_DIFF="dyff between --omit-header --set-exit-code"
source <(kubectl completion zsh)
source <(kustomize completion zsh)
source <(helm completion zsh)
source $HOME/.zi/plugins/jonmosco---kube-ps1/kube-ps1.sh
PS1='$(kube_ps1)'$PS1

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# openssl
export PATH=/usr/local/Cellar/openssl@3/3.0.8/bin:$PATH
