*Maintained by [@SFR-git](https://github.com/SFR-git)*
# batchful
A simple and easy-to use directory organizer.

No installation needed -- just run `batchful.sh`.

## Usage
Run the file from terminal using `$ ./batchful.sh` with the desired organization method and directory.
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
