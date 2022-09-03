#!/bin/bash -e

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

echo "Running delete .localized end .DS_Store ..."

### Home directory.
for localize in "${localizes[@]}"; do
  tar_dir=~/${localize}
  if [ -n "$(ls $tar_dir/.localized 2> /dev/null)" ]; then
    sudo rm -r $tar_dir/.localized
    echo ".localized in $tar_dir/ is deleted."
  fi
done

### Slash directory.
function SlashDirectory() {
  if [ -n "$(ls /$1$2.localized 2> /dev/null)" ]; then
    sudo rm -r /$1$2.localized
    echo ".localized in /$1$2 is deleted."
  fi
}
SlashDirectory "Applications/"
SlashDirectory "Library/"
SlashDirectory "Applications/" "Utilities/"

defaults write com.apple.finder AppleShowAllFiles TRUE # Show hidden files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores True # Do not generate .DS_Store.
killall Finder

### delete all .DS_Store
sudo find / -name ".DS_Store" -depth -exec rm {} \;
