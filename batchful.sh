#!/bin/bash

#   _             _         _       __         _
#  | |__    __ _ | |_  ___ | |__   / _| _   _ | |
#  | '_ \  / _` || __|/ __|| '_ \ | |_ | | | || |
#  | |_) || (_| || |_| (__ | | | ||  _|| |_| || |
#  |_.__/  \__,_| \__|\___||_| |_||_|   \__,_||_|

if [[ $1 = "--name" ]] || [[ $1 = "-n" ]]; then # by file name
if [ -d "$2" ]; then # directory operand validity check
  echo \'$2\' will be sorted by file name. # need to add actual code
else
  echo batchful: invalid directory operand \'$2\'
  echo Try \'./batchful.sh --help\' for more information.
  fi

elif [[ $1 = "--type" ]] || [[ $1 = "-t" ]]; then # by file extension
  if [ -d "$2" ]; then # directory operand validity check
    echo \'$2\' will be sorted by file extension. # need to add actual code
  else
    echo batchful: invalid directory operand \'$2\'
    echo Try \'./batchful.sh --help\' for more information.
  fi

# phrase

elif [[ $1 = "--github" ]] || [[ $1 = "-g" ]]; then # link to GitHub
  echo batchful: a simple directory organizer
  echo Made by 3174N with help from SFR-git
  read -r -p "Open GitHub repo? [Y/n] " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]] || [[ $response == "" ]]; then
      xdg-open https://github.com/3174N/batchful/tree/bash
    elif [[ $response =~ ^([nN][oO]|[nN])$ ]]; then
      exit
    else
      echo
      echo Invalid response \'$response\' -- Aborting...
    fi

elif [[ $1 = "--help" ]] || [[ $1 = "-h" ]]; then # help
  echo batchful v0.2.0-alpha
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
