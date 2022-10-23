#!/bin/bash

DOTPATH=${HOME}/dotfiles
GITHUB_URL=https://github.com/GotoRen/dotfiles
OS_NAME="$(uname | awk '{print tolower($0)}')"
OS_FULL="$(uname -a)"
OS_TYPE=

if [ ${OS_NAME} = "linux" ]; then
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
  elif [ $(echo ${OS_FULL} | grep -c "microsoft-standard-WSL") -gt 0 ]; then
    # WSL
    if [ $(cat /etc/os-release | grep -c "Ubuntu") -gt 0 ]; then
      OS_TYPE="apt"
    fi
  fi
elif [ ${OS_NAME} = "darwin" ]; then
  OS_TYPE="brew"
fi

if [ ${OS_TYPE} = "" ]; then
  _error "Not supported OS. [${OS_NAME}]"
fi

if [ ${OS_TYPE} = "brew" ]; then
  echo "🚀 ⟫⟫⟫ Your environment is macOS."
  xcode-select --install
elif [ ${OS_TYPE} = "apt" ]; then
  echo "🚀 ⟫⟫⟫ Your environment is Debian."
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y build-essential procps curl file git
  sudo dpkg-reconfigure dash # change dash -> bash
elif [ ${OS_TYPE} = "yum" ]; then
  echo "🚀 ⟫⟫⟫ Your environment is RedHat."
  sudo yum groupinstall -y 'Development Tools'
  sudo yum install -y procps-ng curl file git
  sudo yum install -y libxcrypt-compat
fi

if type "git" >/dev/null 2>&1; then
  if [ -d ${DOTPATH} ]; then
    cd ${DOTPATH} && git pull
  else
    git clone ${GITHUB_URL}.git ${DOTPATH}
  fi
else
  echo "Install git!"
  exit 1
fi

### Then, it performs setup.sh.
sh ${DOTPATH}/bin/setup.sh
