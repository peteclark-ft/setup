#!/bin/bash

cd $(dirname $0)
chmod 744 *.sh

volume=${1:-"/Volumes/Barry"}

. ./log.sh

start_log

./pre-chef.sh ${volume}

sudo chef-client -r dev-mac-setup

./mac-preferences.sh
./cli-tools.sh
./apps.sh
