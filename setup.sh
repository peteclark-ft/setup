#!/bin/bash

cd $(dirname $0)
chmod 744 *.sh

. ./log.sh

start_log

./mac-preferences.sh
./cli-tools.sh
./folders.sh
./apps.sh

# ./docker.sh
