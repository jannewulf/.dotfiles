# ~/.profile has the stuff NOT specifically related to bash, such as environment variables (PATH and friends)
# Anything that should be available to graphical applications OR to sh (or bash invoked as sh) MUST be in ~/.profile
# Anything that should be available only to login shells should go in ~/.profile
# https://superuser.com/a/789465

PATH="$HOME/.local/bin:$PATH"

