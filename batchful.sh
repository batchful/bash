#!/bin/bash

#   _             _         _       __         _
#  | |__    __ _ | |_  ___ | |__   / _| _   _ | |
#  | '_ \  / _` || __|/ __|| '_ \ | |_ | | | || |
#  | |_) || (_| || |_| (__ | | | ||  _|| |_| || |
#  |_.__/  \__,_| \__|\___||_| |_||_|   \__,_||_|

# preconfiguration
## version
ver="bash-v0.2.0"
## forcing
FORCED=0
if [[ $@ = *"--force"* ]] || [[ $4 = *"-f"* ]]; then FORCED=1
fi
## cut regex
regex="${3##"phrase="}" # cut prefix

# by file name
if [[ $1 = "--name" ]] || [[ $1 = "-n" ]]; then
if [ -d "$2" ]; then # directory operand validity check
if [[ $FORCED -eq 0 ]]; then read -r -p "'$2' will be sorted by file name. Continue? [Y/n] " response
fi
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]] || [[ $response == "" ]] || [[ $FORCED -eq 1 ]]; then
      cd "$2"
      for file in "$2"/*; do
        [ ! -d "$file" ] || continue # skip directories
          pathless="${file##*/}" # cut path
          extless="${pathless%%.*}" # cut extension
          parless="./${extless%% (*)}"
          if [[ "$pathless" = "$extless" ]]; then # if file is extensionless
            loop=1
            while true; do
              [ -v "batchful-bash-temp-$loop" ] || mkdir "batchful-bash-temp-$loop" && break # create temporary folder
              loop=$((loop+1))
              done
            mv "$extless" ./"batchful-bash-temp-$loop"
            if [[ ! -a "./$parless" ]]; then
              mkdir "$parless" # create directory if doesn't exist
            fi
            mv ./"batchful-bash-temp-$loop"/"$extless" "$parless" # move extensionless directly
            rmdir "batchful-bash-temp-$loop"
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
    if [[ $FORCED -eq 0 ]]; then read -r -p "'$2' will be sorted by file extension. Continue? [Y/n] " response; fi
      if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]] || [[ $response == "" ]] || [[ $FORCED -eq 1 ]]; then
        cd "$2"
        for extful in "$2"/*.*; do # skip extensionless
          [ ! -d "$extful" ] || continue # skip directories
            if [[ ! -a "./${extful#*.}" ]]; then mkdir "${extful#*.}"; fi # create directory if doesn't exist
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

# by phrase
elif [[ $1 = "--phrase" ]] || [[ $1 = "-p" ]]; then
  if [[ $3 = "phrase="* ]] && [[ ! $3 = "phrase=" ]]; then
    if [ -d "$2" ]; then # directory operand validity check
      if [[ $FORCED -eq 0 ]]; then read -r -p "All files in '$2' containing '$regex' in their name will be sorted. Continue? [Y/n] " response; fi
        if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]] || [[ $response == "" ]] || [[ $FORCED -eq 1 ]]; then
          cd "$2"
          matches=("$2"/*"$regex"*) # create array of files
          if [[ ! -f "${matches[0]}" ]]; then # if array contains invalid files
            echo
            echo Could not find any files containing \'$regex\' -- No changes were made.
            echo Aborting...; exit; fi
          if [[ ! -a "$regex" ]]; then mkdir "$regex"; fi # create directory if doesn't exist
          for file in "${matches[@]}"; do
            mv "$file" "./$regex"
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
  else
    echo Invalid phrase operand \'$3\' -- Aborting...
    echo Try \'./batchful.sh --help\' for more information.
fi


# link to GitHub
elif [[ $1 = "--github" ]] || [[ $1 = "-g" ]]; then
  echo batchful: a simple directory organizer
  echo Made by 3174N with help from SFR-git
  read -r -p "Open GitHub repo? [Y/n] " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]] || [[ $response == "" ]]; then
      xdg-open https://github.com/batchful/batchful-bash
    elif [[ $response =~ ^([nN][oO]|[nN])$ ]]; then
      exit
    else
      echo
      echo Invalid response \'$response\' -- Aborting...
    fi

# help
elif [[ $1 = "--help" ]] || [[ $1 = "-h" ]]; then
  echo batchful $ver
  echo Usage: ./batchful.sh [OPTION] [DIRECTORY] [CONTEXTUAL] [EXTRAOPTION] [EXTRAOPTION] ...
  echo
  echo Options:
  echo \ \ \ [--name, -n] Sort by file name
  echo \ \ \ [--extension, -e] Sort by file extension
  echo \ \ \ [--phrase, -p] Sort files with certain phrase
  echo \ \ \ [--github, -g] Link to GitHub
  echo \ \ \ [--help, -h] Prints this help
  echo
  echo Context-specific options:
  echo \ \ \ [phrase=\"foo\"] Desired regex to search for
  echo
  echo Extra options:
  echo \ \ \ [--force, -f] Skip confirmation prompts
  echo
  echo Run without parameters or open from file manager to use GUI.

# GUI
elif [[ $1 = "" ]]; then
    yad --question --title="batchful $ver" --text="\n<span font='24'><b>batchful</b></span>\n<span font='11.3'>Sort files with ease</span>\n" --button="Start":0 --button="GitHub":2 --button=gtk-cancel:1 --buttons-layout=center --justify=center --text-align=center --center
    foo=$?
    if [[ "$foo" -eq 1 ]]; then exit
    elif [ "$foo" -eq 2 ]; then
      xdg-open https://github.com/batchful/bash && exit 0
    fi
    dir=`yad --file-selection --title="Select a directory to sort" --directory  --center --width=800 --height=500`
    if [ "$?" = 1 ]; then exit; fi
    optraw=`yad --title="batchful $ver" --list --column="Select a method of sorting:" --width=300 --center "Sort by file name" "Sort by file extension" --button=gtk-cancel:1`
    if [ "$optraw" == "" ]; then exit; fi
    if [[ "$optraw" == "Sort by file name|" ]]; then opt="name"
    elif [[ "$optraw" == "Sort by file extension|" ]]; then opt="extension"; fi
    yad --question --center --title="batchful $ver" --text="Directory '<i>$dir</i>'\nwill be sorted by <b>file $opt</b>.\nContinue?" --width=250 --button=gtk-no:1 --button=gtk-yes:0 --buttons-layout=center
    if [ "$?" = 1 ]; then exit; fi
    ./batchful.sh "--$opt" "$dir" -f
    yad --info --center --text-align=center --title="batchful $ver" --text="Folder sorted succesfully." --width=200 --button="OK":0

else
  echo batchful: unrecognised option \'$1\'
  echo Try \'./batchful.sh --help\' for more information.

fi
