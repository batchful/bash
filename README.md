#### [batch](https://github.com/3174N/batchful/tree/master/) / bash
# batchful
A simple and easy-to use directory organizer. 

No installation needed -- just run `batchful.sh` from terminal.

## Usage
Run the file from terminal using `$ ./batchful.sh` with the desired organization method and directory.

### Configuration
There are currently two implemented methods of organization *(more coming soon -- see below)*: 
- By file extension: creates a directory for every filetype and sorts the files accordingly. 
- By file name: creates a folder for every single file name and sorts the files into them.

### Syntax
` $ ./batchful.sh [OPTION] [DIRECTORY]`

[--name, -n] Sort by file name

[--type, -t] Sort by file extension

[--github, -g] Link to GitHub

[--help, -h] Prints this help

## Coming Soon
- The option to sort files by regex: finds a specific phrase anywhere in the file name
- A GUI version of the program is in early development, but is low on our list
- The ability to search sub-folders for items and rename files if names clash
- Making the file extension option only create folders for used files
