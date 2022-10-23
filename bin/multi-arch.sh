#!/bin/bash -eu

DOTPATH=${HOME}/dotfiles
ZSHPATH=${DOTPATH}/zsh
OS_NAME="$(uname | awk '{print tolower($0)}')"
OS_FULL="$(uname -a)"
OS_TYPE=

if [ "${OS_NAME}" == "linux" ]; then
  if [ $(echo "${OS_FULL}" | grep -c "amzn1") -gt 0 ]; then
    OS_TYPE="yum"
  elif [ $(echo "${OS_FULL}" | grep -c "amzn2") -gt 0 ]; then
    OS_TYPE="yum"
  elif [ $(echo "${OS_FULL}" | grep -c "el6") -gt 0 ]; then
    OS_TYPE="yum"
  elif [ $(echo "${OS_FULL}" | grep -c "el7") -gt 0 ]; then
    OS_TYPE="yum"
  elif [ $(echo "${OS_FULL}" | grep -c "Ubuntu") -gt 0 ]; then
    OS_TYPE="apt"
  elif [ $(echo "${OS_FULL}" | grep -c "coreos") -gt 0 ]; then
    OS_TYPE="apt"
  elif [ $(echo "${OS_FULL}" | grep -c "microsoft-standard-WSL") -gt 0 ]; then
    # WSL
    if [ $(cat /etc/os-release | grep -c "Ubuntu") -gt 0 ]; then
      OS_TYPE="apt"
    fi
  fi
elif [ "${OS_NAME}" == "darwin" ]; then
  OS_TYPE="brew"
fi

function ConfigurePathsForMultiArchitecture() {
  ### config.zsh
  sed -i '' s%"$1"%"$2"%g ${ZSHPATH}/config.zsh

  ### alias.zsh
  sed -i '' s%"$1"%"$2"%g ${ZSHPATH}/alias.zsh
}

################################################################################################################
# This section manages architecture dependent configuration files.

ASDF_ARM_PATH=". /opt/homebrew/opt/asdf/libexec/asdf.sh"
ASDF_X86_64_PATH=". /usr/local/opt/asdf/libexec/asdf.sh"

GSDK_ZSH_ARM_PATH="source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'"
GSDK_ZSH_X86_64_PATH="source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'"

GSDK_COMPLETTION_ARM_PATH="source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'"
GSDK_COMPLETTION_X86_64_PATH="source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'"

KUBE_PS1_ARM_PATH="'/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh'"
KUBE_PS1_X86_64_PATH="'/usr/local/opt/kube-ps1/share/kube-ps1.sh'"

BREW_ARIAS_ARM_PATH='alias brew="PATH=/opt/homebrew/bin:/usr/bin:/bin:/opt/homebrew/sbin:/usr/sbin:/sbin brew"'
BREW_ARIAS_X86_64_PATH='alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"'

BREW_OPENSSL_ARM_PATH="export PATH=/opt/homebrew/Cellar/openssl@3/3.0.5/bin:\$PATH"
BREW_OPENSSL_X86_64_PATH="export PATH=/usr/local/Cellar/openssl@3/3.0.5/bin:\$PATH"
################################################################################################################

if [ "${OS_TYPE}" == "brew" ]; then

  if [[ "$(uname -m)" == x86_64 ]]; then

    echo "You used Intel Chips."

    ### asdf
    ConfigurePathsForMultiArchitecture "${ASDF_ARM_PATH}" "${ASDF_X86_64_PATH}"

    ### google-cloud-sdk
    ConfigurePathsForMultiArchitecture "${GSDK_ZSH_ARM_PATH}" "${GSDK_ZSH_X86_64_PATH}"
    ConfigurePathsForMultiArchitecture "${GSDK_COMPLETTION_ARM_PATH}" "${GSDK_COMPLETTION_X86_64_PATH}"

    ### kube-ps1
    ConfigurePathsForMultiArchitecture "${KUBE_PS1_ARM_PATH}" "${KUBE_PS1_X86_64_PATH}"

    ### brew alias
    ConfigurePathsForMultiArchitecture "${BREW_ARIAS_ARM_PATH}" "${BREW_ARIAS_X86_64_PATH}"

    ### openssl
    ConfigurePathsForMultiArchitecture "${BREW_OPENSSL_ARM_PATH}" "${BREW_OPENSSL_X86_64_PATH}"

  elif [[ "$(uname -m)" == arm64 ]]; then

    echo "You used Apple Silicon."

    ### asdf
    ConfigurePathsForMultiArchitecture "${ASDF_X86_64_PATH}" "${ASDF_ARM_PATH}"

    ### google-cloud-sdk
    ConfigurePathsForMultiArchitecture "${GSDK_ZSH_X86_64_PATH}" "${GSDK_ZSH_ARM_PATH}"
    ConfigurePathsForMultiArchitecture "${GSDK_COMPLETTION_X86_64_PATH}" "${GSDK_COMPLETTION_ARM_PATH}"

    ### kube-ps1
    ConfigurePathsForMultiArchitecture "${KUBE_PS1_X86_64_PATH}" "${KUBE_PS1_ARM_PATH}"

    ### brew alias
    ConfigurePathsForMultiArchitecture "${BREW_ARIAS_X86_64_PATH}" "${BREW_ARIAS_ARM_PATH}"

    ### openssl
    ConfigurePathsForMultiArchitecture "${BREW_OPENSSL_X86_64_PATH}" "${BREW_OPENSSL_ARM_PATH}"

  else
    _error "Not supported OS. [$(uname -m)]"
    exit 1
  fi
else
  echo -e "\n😇 Skip this setup phase. [${OS_NAME}]"
fi
