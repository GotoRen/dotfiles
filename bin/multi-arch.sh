#!/bin/bash -eu

################################################################################################################
# This section manages architecture dependent configuration files.

ASDF_ARM_PATH=". /opt/homebrew/opt/asdf/libexec/asdf.sh"
ASDF_X86_64_PATH=". /usr/local/opt/asdf/libexec/asdf.sh"

GSDK_ZSH_ARM_PATH="source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'"
GSDK_ZSH_X86_64_PATH="source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'"

GSDK_COMPLETTION_ARM_PATH="source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'"
GSDK_COMPLETTION_X86_64_PATH="source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'"

BREW_ARIAS_ARM_PATH='alias brew="PATH=/opt/homebrew/bin:/usr/bin:/bin:/opt/homebrew/sbin:/usr/sbin:/sbin brew"'
BREW_ARIAS_X86_64_PATH='alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin brew"'
################################################################################################################

function ConfigurePathsForMultiArchitecture() {
  ### asdf
  sed -i.tmp -e s%"$1"%"$2"%g sample.md; rm *.tmp

  ### google-cloud-sdk
  sed -i.tmp -e s%"$1"%"$2"%g sample.md; rm *.tmp
  sed -i.tmp -e s%"$1"%"$2"%g sample.md; rm *.tmp

  ### brew alias
  sed -i.tmp -e s%"$1"%"$2"%g sample.md; rm *.tmp
}


### main section. ###
if [[ "$(uname -m)" == x86_64 ]]; then
    echo "You used Intel Chips."
    ### asdf
    ConfigurePathsForMultiArchitecture "${ASDF_ARM_PATH}" "${ASDF_X86_64_PATH}"

    ### google-cloud-sdk
    ConfigurePathsForMultiArchitecture "${GSDK_ZSH_ARM_PATH}" "${GSDK_ZSH_X86_64_PATH}"
    ConfigurePathsForMultiArchitecture "${GSDK_COMPLETTION_ARM_PATH}" "${GSDK_COMPLETTION_X86_64_PATH}"

    ### brew alias
    ConfigurePathsForMultiArchitecture "${BREW_ARIAS_ARM_PATH}" "${BREW_ARIAS_X86_64_PATH}"
  elif [[ "$(uname -m)" == arm64 ]]; then
    echo "You used Apple Silicon."
    ################################################################
    ### asdf
    ConfigurePathsForMultiArchitecture "${ASDF_X86_64_PATH}" "${ASDF_ARM_PATH}"

    ### google-cloud-sdk
    ConfigurePathsForMultiArchitecture "${GSDK_ZSH_X86_64_PATH}" "${GSDK_ZSH_ARM_PATH}"
    ConfigurePathsForMultiArchitecture "${GSDK_COMPLETTION_X86_64_PATH}" "${GSDK_COMPLETTION_ARM_PATH}"

    ### brew alias
    ConfigurePathsForMultiArchitecture "${BREW_ARIAS_X86_64_PATH}" "${BREW_ARIAS_ARM_PATH}"
    ################################################################
  else
    _error "Not supported OS. [${uname -m}]"
    exit 1
fi