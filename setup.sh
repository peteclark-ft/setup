#!/bin/bash

cd $(dirname $0)
chmod 744 *.sh

. ./log.sh

start_log

./folders.sh
./mac-preferences.sh
./cli-tools.sh
./apps.sh
