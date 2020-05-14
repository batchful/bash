#!/bin/bash

# Options:

if [[ $1 = "--name" ]] || [[ $1 = "-n" ]]; then # by file name
  if [[ $2 = "" ]]; then # Missing directory operand
    echo batchful: missing directory operand
    echo Try \'./batchful.sh --help\' for more information.
  else echo \'$2\' will be sorted by file name.
  fi

elif [[ $1 = "--type" ]] || [[ $1 = "-t" ]]; then # by file extension
  if [[ $2 = "" ]]; then # Missing directory operand
    echo batchful: missing directory operand
    echo Try \'./batchful.sh --help\' for more information.
  else echo \'$2\' will be sorted by file extension.
  fi

# elif [[ $1 = "--phrase" ]] || [ $1 = "-p" ]; then # by phrase
#   echo "placeholder phrase"

elif [[ $1 = "--github" ]] || [[ $1 = "-g" ]]; then # link to GitHub
  echo batchful: a simple directory organizer
  echo Made by 3174N with help from SFR-git
  read -r -p "Open GitHub repo? [Y/n] " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then # need to add Enter keypress
      xdg-open https://github.com/3174N/batchful/tree/bash
    elif [[ $response =~ ^([nN][oO]|[nN])$ ]]; then
      exit
    else
      echo
      echo Unrecognised option \'$response\' -- Aborting...
    fi

elif [[ $1 = "--help" ]] || [[ $1 = "-h" ]]; then # help
  echo batchful v0.1.0
  echo Usage: ./batchful.sh [OPTION] [DIRECTORY]
  echo
  echo Options:
  echo \ \ \ [--name, -n] Sort by file name
  echo \ \ \ [--type, -t] Sort by file extension
  echo \ \ \ [--github, -g] Link to GitHub
  echo \ \ \ [--help, -h] Prints this help

else
  echo batchful: unrecognised option \'$1\'
  echo Try \'./batchful.sh --help\' for more information.

fi
