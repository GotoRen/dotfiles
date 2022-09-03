# zsh-completions
zi ice wait lucid blockf atpull'zi creinstall -q .'
zi light zsh-users/zsh-completions
autoload -U compinit
compinit -u

# zsh-autosuggestions
zi ice wait lucid atload"!_zsh_autosuggest_start"
zi load zsh-users/zsh-autosuggestions

# term 256 color
zi light chrissicool/zsh-256color

# jq enhance plugin
zi light reegnz/jq-zsh-plugin

# enhancd
zi light b4b4r07/enhancd

# fzf
zi ice as"command" from"gh-r" mv"fzf* -> fzf" pick"fzf/fzf"
zi light junegunn/fzf

# jq command
zi ice as"command" from"gh-r" mv"jq* -> jq" pick"jq"
zi light stedolan/jq

# file output
zi ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zi light sharkdp/bat
 
# syntax highlight
zi light 'zdharma/fast-syntax-highlighting'

# git open
zi light 'paulirish/git-open'

# emoji
zi light 'b4b4r07/emoji-cli'
bindkey '^xe' emoji::cli
bindkey '^x^e' emoji::cli

# cooperation with peco
zi light 'mollifier/anyframe'
