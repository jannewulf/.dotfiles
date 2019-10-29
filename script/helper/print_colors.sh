#!/usr/bin/env bash
#
# Color printing functions

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GRAYLIGHT='\033[0;37m'
GRAYDARK='\033[1;30m'
REDLIGHT='\033[1;31m'
GREENLIGHT='\033[1;32m'
YELLOW='\033[1;33m'
BLUELIGHT='\033[1;34m'
PURPLELIGHT='\033[1;35m'
CYANLIGHT='\033[1;36m'
WHITE='\033[1;37m'
NOCOLOR='\033[0m'

print_colored () {
  printf "$1$2${NOCOLOR}"
}

print_black () {
  print_colored "$BLACK" "$1"
}

print_red () {
  print_colored "$RED" "$1"
}

print_green () {
  print_colored "$GREEN" "$1"
}

print_brown () {
  print_colored "$BROWN" "$1"
}


print_blue () {
  print_colored "$BLUE" "$1"
}


print_purple () {
  print_colored "$PURPLE" "$1"
}


print_cyan () {
  print_colored "$CYAN" "$1"
}


print_gray_light () {
  print_colored "$GRAYLIGHT" "$1"
}


print_gray_dark () {
  print_colored "$GRAYDARK" "$1"
}


print_red_light () {
  print_colored "$REDLIGHT" "$1"
}


print_green_light () {
  print_colored "$GREENLIGHT" "$1"
}

print_yellow () {
  print_colored "$YELLOW" "$1"
}

print_blue_light () {
  print_colored "$BLUELIGHT" "$1"
}


print_purple_light () {
  print_colored "$PURPLELIGHT" "$1"
}


print_cyan_light () {
  print_colored "$CYANLIGHT" "$1"
}


print_white () {
  print_colored "$WHITE" "$1"
}

