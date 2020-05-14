#!/bin/bash

# Options:

if [[ $1 = "--name" ]] || [[ $1 = "-n" ]]; then # by file name
  echo "placeholder name"

else if [[ $1 = "--type" ]] || [[ $1 = "-t" ]]; then # by file extension
  echo "placeholder type"

# else if [[ $1 = "--phrase" ]] || [ $1 = "-p" ]; then # by phrase
#   echo "placeholder phrase"

else if [[ $1 = "--github" ]] || [[ $1 = "-g" ]]; then # link to GitHub
  echo "https://github.com/3174N/batchful"

else if [[ $1 = "--help" ]] || [[ $1 = "-h" ]]; then # help
  echo "placeholder help"

else
  echo "placeholder error"

fi
fi
fi
fi

## WIP
