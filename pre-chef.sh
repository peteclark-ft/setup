#!/bin/bash

cd $(dirname $0)
. ./log.sh

volume=${1:-"/Volumes/Barry"}

function install_homebrew {
   log_install "Homebrew"

   # brew doctor fails if not updated or pruned.. so do these early.
   brew update
   brew prune

   if brew doctor; then
      log_skipping "Homebrew"
      return
   fi

   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

   brew doctor
   test_install "Homebrew"
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

function install_chef {
  log_install "Chef"
  if chef -v; then
    log_skipping "Chef"
    return
  fi

  brew cask install chefdk
  chef -v
  test_install "Chef"
}

function update_ssh {
  if [[ -d ~/.ssh ]]; then
    log.info ".ssh directory already exists! Skipping step."
    return
  fi

  cp ${volume}/ssh/id_rsa ~/.ssh
  cp ${volume}/ssh/id_rsa.pub ~/.ssh
  cp ${volume}/ssh/config ~/.ssh
  cp ${volume}/ssh/known_hosts ~/.ssh

  chmod 400 ~/.ssh/id_rsa
  chmod 600 ~/.ssh/id_rsa.pub
  chmod 600 ~/.ssh/config
  chmod 600 ~/.ssh/known_hosts
}

function update_chef {
  if [[ -d /etc/chef ]]; then
    log.info "/etc/chef already exists! Skipping step."
    return
  fi

  sudo mkdir /etc/chef/
  sudo cp ${volume}/client.rb /etc/chef/

  mkdir ~/Code/setup/chef/dev-mac-setup/files/
  cp -r "${volume}/Chef Files/*" ~/Code/setup/chef/dev-mac-setup/files/
}

install_homebrew
install_caskroom

update_ssh

install_chef
update_chef

log.info "All done!"
