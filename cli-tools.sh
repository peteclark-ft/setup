#!/bin/bash

cd $(dirname $0)
. ./log.sh

function install_dotfiles {
  log_install "Dotfiles"
  if [[ -d ~/.dotfiles ]]; then
    log_skipping "Dotfiles"
    return
  fi

  cd ~
  git clone git@github.com:peteclark-ft/dotfiles.git
  mv dotfiles .dotfiles
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

  # The Go cask doesn't seem to symlink the binaries...
  cd /usr/local/bin
  ln -s /usr/local/go/bin/go
  ln -s /usr/local/go/bin/godoc
  ln -s /usr/local/go/bin/gofmt
  cd -

  go version
  test_install "Go"
}

function install_java {
  log_install "Java"
  if java -version 2>&1 | grep 1.8; then
    log_skipping "Java"
    return
  fi

  brew cask install java
  java -version
  test_install "Java"
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

function install_ngrok {
  log_install "Ngrok"
  if ngrok version; then
    log_skipping "Ngrok"
    return
  fi

  brew cask install ngrok
  ngrok version
  test_install "Ngrok"
}

function install_nodejs {
  log_install "NodeJS"
  if node -v; then
    log_skipping "NodeJS"
    return
  fi

  brew install nodejs
  node -v
  test_install "NodeJS"
}

function install_mutt {
  log_install "Mutt"
  if mutt -v; then
    log_skipping "Mutt"
    return
  fi

  brew install mutt
  mutt -v
  test_install "Mutt"
}

function install_jq {
  log_install "JQ"
  if jq --version; then
    log_skipping "JQ"
    return
  fi

  brew install jq
  jq --version
  test_install "JQ"
}

function install_dockutil {
  log_install "Dockutil"
  if [[ -d ~/Code/dockutil ]]; then
    log_skipping "Dockutil"
    return
  fi

  cd ~/Code
  git clone git@github.com:kcrawford/dockutil.git
  cd -
}

#brew install bash
brew install python
brew install awscli
brew install fleetctl

install_dotfiles
install_dockutil

install_go
install_java
install_terraform

install_ngrok
install_jq
install_nodejs
install_mutt

brew install thefuck

gem install foreman
brew install spark
brew install emojify

brew install etcd
brew install kubernetes-cli
brew install iperf3
brew install ledger
brew install ffmpeg
brew install coreutils
brew install maven
brew install slimerjs
brew install phantomjs
