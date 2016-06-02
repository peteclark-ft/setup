#!/bin/bash

cd $(dirname $0)
. ./log.sh

function test_install {
  if [ $? -ne 0 ]; then
    log_failed $1
    exit 1
  fi
}

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

   brew doctor
   if [ $? -eq 0 ]; then
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
  brew cask doctor
  if [ $? -eq 0 ]; then
     log_skipping "Homebrew Cask"
     return
  fi

  brew tap caskroom/cask
  mkdir /usr/local/Cellar

  brew tap caskroom/versions

  brew cask doctor
  test_install "Homebrew Cask"
}

function install_git {
  log_install "Git"
  git --version
  if [ $? -eq 0 ]; then
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

function install_dockutil {
  cd ~/Code
  git clone git@github.com:kcrawford/dockutil.git
  cd -
}

install_xcode_tools
install_homebrew
install_caskroom
install_git
