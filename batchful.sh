#!/bin/bash

#   _             _         _       __         _
#  | |__    __ _ | |_  ___ | |__   / _| _   _ | |
#  | '_ \  / _` || __|/ __|| '_ \ | |_ | | | || |
#  | |_) || (_| || |_| (__ | | | ||  _|| |_| || |
#  |_.__/  \__,_| \__|\___||_| |_||_|   \__,_||_|

# by file name
if [[ $1 = "--name" ]] || [[ $1 = "-n" ]]; then
if [ -d "$2" ]; then # directory operand validity check
  read -r -p "'$2' will be sorted by file name. Continue? [Y/n] " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]] || [[ $response == "" ]]; then
      cd "$2"
      for file in "$2"/*; do
        [ ! -d "$file" ] || continue # skip directories
          pathless="${file##*/}" # cut path
          extless="${pathless%%.*}" # cut extension
          parless="./${extless%% (*)}"
          if [[ "$pathless" = "$extless" ]]; then # if file is extensionless
            mkdir "batchful-bash-temp-$extless" # create temp folder
            mv "$extless" ./"batchful-bash-temp-$extless"
            if [[ ! -a "./$parless" ]]; then
              mkdir "$parless" # create directory if doesn't exist
            fi
            mv ./"batchful-bash-temp-$extless"/"$extless" "$parless" # move extensionless directly
            rmdir "batchful-bash-temp-$extless"
            continue
          fi
          if [[ ! -a "./$parless" ]]; then
            mkdir "$parless" # create directory if doesn't exist
          fi
          mv "$file" ./"$parless" # sort by name
      done
      echo
      echo Folder sorted succesfully.
    elif [[ $response =~ ^([nN][oO]|[nN])$ ]]; then
      echo Aborting...
    else
      echo
      echo Invalid response \'$response\' -- Aborting...
    fi
else
  echo batchful: invalid directory operand \'$2\'
  echo Try \'./batchful.sh --help\' for more information.
fi

# by file extension
elif [[ $1 = "--extension" ]] || [[ $1 = "-e" ]]; then
  if [ -d "$2" ]; then # directory operand validity check
    read -r -p "'$2' will be sorted by file extension. Continue? [Y/n] " response
      if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]] || [[ $response == "" ]]; then
        cd "$2"
        for extful in "$2"/*.*; do # skip extensionless
          [ ! -d "$extful" ] || continue # skip directories
            if [[ ! -a "./${extful#*.}" ]]; then mkdir "${extful#*.}" # create directory if doesn't exist
            fi
            mv "$extful" ./"${extful#*.}" # sort by extension
        done
        if [[ ! -d "'$2'/no-extension" ]]; then mkdir no-extension # create extless directory if doesn't exist
        fi
        for extless in "$2"/*; do
          [ ! -d "$extless" ] || continue # skip directories
            mv "$extless" ./no-extension # sort extensionless
        done
        echo
        echo Folder sorted succesfully.
      elif [[ $response =~ ^([nN][oO]|[nN])$ ]]; then
        echo Aborting...
      else
        echo
        echo Invalid response \'$response\' -- Aborting...
      fi
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
  echo batchful bash-v0.1.0-beta
  echo Usage: ./batchful.sh [OPTION] [DIRECTORY]
  echo
  echo Options:
  echo \ \ \ [--name, -n] Sort by file name
  echo \ \ \ [--extension, -e] Sort by file extension
  echo \ \ \ [--github, -g] Link to GitHub
  echo \ \ \ [--help, -h] Prints this help

else
  echo batchful: unrecognised option \'$1\'
  echo Try \'./batchful.sh --help\' for more information.

fi
