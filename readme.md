# My dotfiles for Ubuntu
## Structure
In the script directory you find two scripts which are called `install` and `setup`.
The `install` script searches in all the directories in this repo for files called `install.sh` and runs them. 
The `setup` script analogously does the same with files called `setup.sh`.

The directories are named thematically.
All scripts called `install.sh` should only install the software regarding the directory they're in. The scripts called `setup.sh` are there to link files, create cron jobs, etc.
So if I want to install and setup git, I create `git/install.sh` and `git/setup.sh` scripts.

Both scripts will ask you where your `.dotfiles` directory is located if the `DOTFILES` environment variable is not set. It then sets this environment variable for you. It will also be added to the `.profile` so you have always access to it.

## Helpful links
[Choosing between .bashrc, .profile, .bash_profile, etc](https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc)
