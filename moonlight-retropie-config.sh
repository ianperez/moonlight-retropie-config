#!/bin/bash

mkdir -p ~/RetroPie/roms/moonlight

start=0
moonlight list $1 | while read line; do
  if [[ $line == 1.* ]]; then
    start=1
  fi
  if [[ $start == 1 ]]; then
    name=${line:$(expr index "$line" " ")}
    touch ~/RetroPie/roms/moonlight/"${name}".game
  fi
done

exit 0

