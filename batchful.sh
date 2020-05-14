#!/bin/bash

# Options:

if [[ $1 = "--name" ]] || [[ $1 = "-n" ]]; then # by file name
  echo "placeholder name"

elif [[ $1 = "--type" ]] || [[ $1 = "-t" ]]; then # by file extension
  echo "placeholder type"

# elif [[ $1 = "--phrase" ]] || [ $1 = "-p" ]; then # by phrase
#   echo "placeholder phrase"

elif [[ $1 = "--github" ]] || [[ $1 = "-g" ]]; then # link to GitHub
  echo "batchful: a simple directory organizer"
  echo "Made by 3174N with help from SFR-git"
  read -r -p "Open GitHub repo? [Y/n] " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then # need to add Enter keypress
      xdg-open https://github.com/3174N/batchful/tree/bash
    elif [[ $response =~ ^([nN][oO]|[nN])$ ]]; then
      exit
    fi

elif [[ $1 = "--help" ]] || [[ $1 = "-h" ]]; then # help
  echo "placeholder help"

else
  echo "placeholder error"

fi
