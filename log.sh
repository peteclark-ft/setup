#!/bin/bash
# Logger for the setup scripts

log_file=$(pwd)/app.log

function start_log {
  log.info "Congrats on the new Mac!"
  log.info "Setting it up..."
}

function log_install {
  log.info "Installing $1..."
}

function log_skipping {
  log.info "Skipping install of $1 - already installed..."
}

function log_failed {
  log.fatal "$1 didn't install correctly! Please remedy manually and re-run this script again!"
}

function log_finished {
  log.info "Finished installation of $1!"
}

function log.fatal {
  echo "$(date) FATAL - $1"
  echo "$(date) FATAL - $1" >> ${log_file}
}

function log.info {
  echo "$(date)  INFO - $1"
  echo "$(date)  INFO - $1" >> ${log_file}
}
