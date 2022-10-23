#!/bin/bash -e

OS_NAME="$(uname | awk '{print tolower($0)}')"
OS_FULL="$(uname -a)"
OS_TYPE=

localizes=(
  Applications
  Documents
  Downloads
  Library
  Movies
  Music
  Pictures
  Public
  Desktop
)

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
  elif [ $(echo ${OS_FULL} | grep -c "microsoft-standard-WSL") -gt 0 ]; then
    # WSL
    if [ $(cat /etc/os-release | grep -c "Ubuntu") -gt 0 ]; then
      OS_TYPE="apt"
    fi
  fi
elif [ ${OS_NAME} == "darwin" ]; then
  OS_TYPE="brew"
fi

### Slash directory.
function SlashDirectory() {
  if [ -n "$(ls /$1$2.localized 2>/dev/null)" ]; then
    sudo rm -r /$1$2.localized
    echo ".localized in /$1$2 is deleted."
  fi
}

if [ ${OS_TYPE} == "brew" ]; then

  echo "\\n🏃 Running delete .localized..."

  ### Home directory.
  for localize in "${localizes[@]}"; do
    tar_dir=~/${localize}
    if [ -n "$(ls ${tar_dir}/.localized 2>/dev/null)" ]; then
      sudo rm -r ${tar_dir}/.localized
      echo ".localized in ${tar_dir}/ is deleted."
    fi
  done

  SlashDirectory "Applications/"
  SlashDirectory "Library/"
  SlashDirectory "Users/"
  SlashDirectory "Applications/" "Utilities/"
  SlashDirectory "Library/" "Compositions/"

  defaults write com.apple.finder AppleShowAllFiles TRUE                 # Show hidden files.
  defaults write com.apple.desktopservices DSDontWriteNetworkStores True # Do not generate .DS_Store.
  killall Finder

  echo "\\n🏃 Running delete .DS_Store ..."
  ### delete all .DS_Store
  sudo find / -name ".DS_Store" -depth -exec rm {} \;

else
  echo "\\n😇 Skip this setup phase. [${OS_NAME}]"
fi
