#!/bin/bash

for c in $(brew cask list); do
    info=$(brew cask info $c)
    latest=$(echo "$info" | head -1 | cut -d ' ' -f2)
    installed=$(echo "$info" | sed -n '3p' | awk '{print $(1)}' | awk -F '/' '{print $NF}')
    if [ "$installed" != "$latest" ]; then
        echo "$c installed is '$installed', latest is '$latest'"
         
        if [ "$1" != "ls" ]; then
          brew cask reinstall $c
       fi 
    fi
done

