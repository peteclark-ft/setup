#!/bin/bash

cd $(dirname $0)
. ./log.sh

function install_slack {
  log_install "Slack"
  check_app_install "Slack"
  if [ $? -eq 0 ]; then
     log_skipping "Slack"
     return
  fi

  brew cask install slack

  check_app_install "Slack"
  test_install "Slack"

  add_app_to_dock "/Applications/Slack"
  log_finished "Slack"
}

function install_atom {
  log_install "Atom"
  check_app_install "Atom"
  if [ $? -eq 0 ]; then
     log_skipping "Atom"
     return
  fi

  brew cask install atom

  check_app_install "Atom"
  test_install "Atom"

  add_app_to_dock "/Applications/Atom"
  log_finished "Atom"
}

function install_intellij {
  log_install "Intellij"
  check_app_install "IntelliJ IDEA CE"
  if [ $? -eq 0 ]; then
     log_skipping "IntelliJ IDEA CE"
     return
  fi

  brew cask install intellij-idea-ce

  check_app_install "IntelliJ IDEA CE"
  test_install "IntelliJ IDEA CE"

  add_app_to_dock "/Applications/\"IntelliJ IDEA CE\""
  log_finished "IntelliJ IDEA CE"
}

function install_sourcetree {
  log_install "SourceTree"
  check_app_install "SourceTree"
  if [ $? -eq 0 ]; then
     log_skipping "SourceTree"
     return
  fi

  brew cask install sourcetree

  check_app_install "SourceTree"
  test_install "SourceTree"

  add_app_to_dock "/Applications/SourceTree"
  log_finished "SourceTree"
}

function install_chrome {
  log_install "Google Chrome"
  check_app_install "Google Chrome"
  if [ $? -eq 0 ]; then
     log_skipping "Google Chrome"
     return
  fi

  brew cask install google-chrome

  check_app_install "Google Chrome"
  test_install "Google Chrome"

  add_app_to_dock "/Applications/\"Google Chrome\""
  log_finished "Google Chrome"
}

function install_robomongo {
  log_install "Robomongo"
  check_app_install "Robomongo"
  if [ $? -eq 0 ]; then
     log_skipping "Robomongo"
     return
  fi

  brew cask install robomongo

  check_app_install "Robomongo"
  test_install "Robomongo"
  log_finished "Robomongo"
}

function install_spotify {
  log_install "Spotify"
  check_app_install "Spotify"
  if [ $? -eq 0 ]; then
     log_skipping "Spotify"
     return
  fi

  brew cask install spotify

  check_app_install "Spotify"
  test_install "Spotify"

  add_app_to_dock "/Applications/Spotify"
  log_finished "Spotify"
}

function install_docker {
  log_install "Docker"
  check_app_install "Docker"
  if [ $? -eq 0 ]; then
     log_skipping "Docker"
     return
  fi

  brew cask install dockertoolbox

  check_app_install "Docker"
  test_install "Docker"
  log_finished "Docker"
}

install_docker

function add_app_to_dock {
  # $1 needs to be full path to app.
  # restart_dock needs to be called once done.

  #defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  local dockutil=~/Code/dockutil/scripts/dockutil
  ${dockutil} --add "$1" --position end --no-restart
}

function restart_dock {
  killall Dock
}

install_chrome

install_spotify

add_app_to_dock "/Applications/Mail.app"
add_app_to_dock "/Applications/Contacts.app"
add_app_to_dock "/Applications/Calendar.app"
add_app_to_dock "/Applications/Notes.app"
add_app_to_dock "/Applications/Reminders.app"

install_atom

add_app_to_dock "/Applications/Utilities/Terminal.app"

install_intellij
install_sourcetree
install_slack

add_app_to_dock "/Applications/System Preferences.app"

install_robomongo

restart_dock
