ZSH_PATH="${HOME}/dotfiles/zsh"

if [ -d $ZSH_PATH ]; then
  source $ZSH_PATH/zi.zsh
  source $ZSH_PATH/brew.zsh
  source $ZSH_PATH/plugins.zsh
  source $ZSH_PATH/config.zsh
  source $ZSH_PATH/alias.zsh
else
  print "ZSH CONFIGS NOT FOUND: ~/.zsh"
fi
