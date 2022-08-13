# zsh-completions
zi ice wait lucid blockf atpull'zi creinstall -q .'
zi light zsh-users/zsh-completions

# zsh-autosuggestions
zi ice wait lucid atload"!_zsh_autosuggest_start"
zi load zsh-users/zsh-autosuggestions

# TERM 256 color
zi light chrissicool/zsh-256color

# jq enhance plugin
zi light reegnz/jq-zsh-plugin

# change directory enhancd
zi light b4b4r07/enhancd

# junegunn/fzf
zi ice as"command" from"gh-r" mv"fzf* -> fzf" pick"fzf/fzf"
zi light junegunn/fzf

# stedolan/jq
zi ice as"command" from"gh-r" mv"jq* -> jq" pick"jq"
zi light stedolan/jq

# sharkdp/bat
zi ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zi light sharkdp/bat
 
# other
zi light 'zdharma/fast-syntax-highlighting'
zi light 'paulirish/git-open'
zi light 'b4b4r07/emoji-cli'
zi light 'mollifier/anyframe'
