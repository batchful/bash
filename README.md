*Maintained by [@SFR-git](https://github.com/SFR-git)*

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/F1F61SQUE)
# batchful
A simple and easy-to use directory organiser.

No installation needed -- just run `batchful.sh`.

## Usage
Run the file from terminal using `$ ./batchful.sh` with the desired organisation method and directory.
**OR** Run the file without any parameters / from your file manager.

### Dependencies
To run batchful, the following dependencies are needed:
* `yad` (necessary for GUI)
  * for Arch-based distributions: [`yad-git`](https://aur.archlinux.org/packages/yad-git/)<sup>AUR</sup>
  * for Debian-based distributions: `sudo apt install yad`
  * for Fedora/RedHat: `sudo dnf install yad`
  * from [SourceForge](https://sourceforge.net/projects/yad-dialog/)
  * from [GitHub](https://github.com/v1cont/yad)

### Configuration
There are currently two implemented methods of organisation:
* By file extension: creates a directory for every filetype used in the folder and sorts the files accordingly.
* By file name: creates a folder for every single file name and sorts the files into them.
* By phrase: takes files containing a certain phrase in their name and puts them in their own directory.

### Syntax
`$ ./batchful.sh [OPTION] [DIRECTORY] [CONTEXTUAL] [EXTRAOPTION] [EXTRAOPTION] ...`

#### Options:

[--name, -n] Sort by file name

[--extension, -e] Sort by file extension

[--github, -g] Link to GitHub

[--help, -h] Prints this help

#### Context-specific options:
[phrase="foo"] Desired regex to search for

#### Extra options:

[--force, -f] Skip all confirmation prompts.


## Coming Soon
- The ability to search sub-folders for items and rename files if names clash
- Thinking about an option to toggle case-sensitivity
