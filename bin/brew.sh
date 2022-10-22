#!/bin/bash -eu

OS_NAME="$(uname | awk '{print tolower($0)}')"
OS_FULL="$(uname -a)"
OS_TYPE=
OS=
DOTFILES="$(
  cd $(dirname $0)
  pwd
)/.."

if [ ${OS_NAME} == "linux" ]; then
  if [ $(echo ${OS_FULL} | grep -c "amzn1") -gt 0 ]; then
    OS_TYPE="yum"
  elif [ $(echo ${OS_FULL} | grep -c "amzn2") -gt 0 ]; then
    OS_TYPE="yum"
  elif [ $(echo ${OS_FULL} | grep -c "el6") -gt 0 ]; then
    OS_TYPE="yum"
  elif [ $(echo ${OS_FULL} | grep -c "el7") -gt 0 ]; then
    OS_TYPE="yum"
  elif [ $(echo ${OS_FULL} | grep -c "Ubuntu") -gt 0 ]; then
    OS_TYPE="apt"
  elif [ $(echo ${OS_FULL} | grep -c "coreos") -gt 0 ]; then
    OS_TYPE="apt"
  fi
elif [ ${OS_NAME} == "darwin" ]; then
  OS_TYPE="brew"
fi

if [ ${OS_TYPE} == "" ]; then
  echo -e "Not supported OS. [${OS_NAME}]"
  exit 1
fi

if [ ${OS_NAME} == "darwin" ]; then
  if !(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ "$(uname -m)" == arm64 ]]; then
      # M1
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      # x86/x64
      eval "$(/usr/local/bin/brew shellenv)"
    fi
    which brew
  fi
  OS='Mac'
  cd ${DOTFILES}
elif [ ${OS_NAME} == "linux" ]; then
  if !(which brew); then
    if [[ "$(uname -r)" == *microsoft* ]]; then
      echo 'WSL installing Homebrew...'
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
      which brew
    else
      echo 'Linux installing Homebrew...'
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
      which brew
    fi
  fi
  OS='Linux'
  cd ${DOTFILES}
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
  OS='Cygwin'
  echo -e "Cygwin is not yet supported."
  exit 1
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

brew bundle cleanup
brew bundle list

brew bundle

brew bundle check && brew update && brew upgrade
brew doctor
