#### [batch](https://github.com/3174N/batchful/tree/master/) / bash
# batchful
A simple and easy-to use directory organizer.

No installation needed -- just run `batchful.sh`.

## Usage
Run the file from terminal using `$ ./batchful.sh` with the desired organization method and directory.
**OR**
Run the file without any parameters / from your file manager.

### Dependencies
To run batchful, the following dependencies are needed:
* `zenity` (necessary for GUI)
  * for Debian-based distributions:
  `$ sudo apt-get install zenity`
  * for Arch-based distributions:
  *[Install from the AUR](https://aur.archlinux.org/packages/zenity-git/)*
  * using Snap:
  `$ sudo snap install zenity`

### Configuration
There are currently two implemented methods of organization *(more coming soon -- see below)*:
* By file extension: creates a directory for every filetype used in the folder and sorts the files accordingly.
* By file name: creates a folder for every single file name and sorts the files into them.

### Syntax
`$ ./batchful.sh [OPTION] [DIRECTORY] [EXTRAOPTION] [EXTRAOPTION] ...`

#### Options:

[--name, -n] Sort by file name

[--extension, -e] Sort by file extension

[--github, -g] Link to GitHub

[--help, -h] Prints this help

#### Extra options:

[--force, -f] Skip all confirmation prompts.


## Coming Soon
- The option to sort files by regex: finds a specific phrase anywhere in the file name
- The ability to search sub-folders for items and rename files if names clash
- Thinking about an option to toggle case-sensitivity
