#!/bin/bash

path=~/RetroPie/roms/moonlight
mkdir -p $path

start=0
moonlight list $1 | while read line; do
  if [[ $line == 1.* ]]; then
    rm $path/*.game
    start=1
  fi
  if [[ $start == 1 ]]; then
    name=${line:$(expr index "$line" " ")}
    touch $path/"${name}".game
  fi
done

exit 0

