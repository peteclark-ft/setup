#!/bin/bash
## Prints out cloned urls

cd ~/Code

for dir in $(ls -d */);
do
  cd ~/Code/${dir}
  git remote show origin | grep Fetch | awk '{print $3}'
done
