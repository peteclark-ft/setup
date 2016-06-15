#!/bin/bash

cd $(dirname $0)
. ./log.sh

function install_xcode_tools {
   log_install "XCode Developer Tools"
   xcode-select --install > /dev/null
   if [ $? -eq 1 ]; then
     log_skipping "XCode Developer Tools"
   fi
   log_finished "XCode Developer Tools"
}

function install_homebrew {
   log_install "Homebrew"
   if brew doctor; then
      log_skipping "Homebrew"
      return
   fi

   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

   brew doctor
   test_install "Homebrew"

   brew update
}

function install_caskroom {
  log_install "Homebrew Cask"
  if brew cask doctor; then
     log_skipping "Homebrew Cask"
     return
  fi

  brew tap caskroom/cask
  mkdir /usr/local/Cellar
  brew cleanup
  brew cask cleanup

  brew tap caskroom/versions

  brew cask doctor
  test_install "Homebrew Cask"
}

function install_git {
  log_install "Git"
  if git --version; then
     log_skipping "Git"
     return
  fi

  brew install git
  git --version
  test_install "Git"
}

function install_dotfiles {
  cd ~
  git clone git@github.com:peteclark-ft/dotfiles.git
  cd -
  cp .bash_profile ~
  log.info "Start a new terminal session to update your profile!"
}

function install_go {
  log_install "Go"
  if go version; then
    log_skipping "Go"
    return
  fi

  brew cask install go
  go version
  test_install "Go"
}

function install_terraform {
  log_install "Terraform"
  if terraform --version; then
    log_skipping "Terraform"
    return
  fi

  brew cask install terraform
  terraform --version
  test_install "Terraform"
}

function install_dockutil {
  cd ~/Code
  git clone git@github.com:kcrawford/dockutil.git
  cd -
}

install_xcode_tools
install_homebrew
install_caskroom
# install_git ## Not required; part of xcode tools
install_go
install_terraform
