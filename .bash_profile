# ~/.bash_profile should be super-simple and just load .profile and .bashrc (in that order)
# https://superuser.com/a/789465

[[ -r ~/.profile ]] && source ~/.profile
[[ -r ~/.bashrc ]] && source ~/.bashrc
