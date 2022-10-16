case ${OSTYPE} in
darwin*)
  # Mac Setting
  PATH="/usr/local/sbin:$PATH" ### zsh PATH
  if [[ "$(uname -m)" == x86_64 ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  elif [[ "$(uname -m)" == arm64 ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    _error "Not supported OS. [$(uname -m)]"
    exit 1
  fi
  ;;
linux*)
  # LinuxBrew
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  ;;
esac
