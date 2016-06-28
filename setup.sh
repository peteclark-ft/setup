#!/bin/bash

cd $(dirname $0)
chmod 744 *.sh

. ./log.sh

start_log

./pre-chef.sh

sudo chef-client -r dev-mac-setup

./mac-preferences.sh
./cli-tools.sh
./apps.sh
