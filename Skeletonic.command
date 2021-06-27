#!/bin/sh
#
#  ____  _        _      _              _        ____
# / ___|| | _____| | ___| |_ ___  _ __ (_) ___  |  _ \  ___   ___ ___
# \___ \| |/ / _ \ |/ _ \ __/ _ \| '_ \| |/ __| | | | |/ _ \ / __/ __|
#  ___) |   <  __/ |  __/ || (_) | | | | | (__  | |_| | (_) | (__\__ \
# |____/|_|\_\___|_|\___|\__\___/|_| |_|_|\___| |____/ \___/ \___|___/
#
# Skeletonic Stylus Documentation v0.0.1
# https://docs.skeletonic.io/en

# Load configuration files
# shellcheck disable=SC2154
# shellcheck disable=SC3000-SC4000
# shellcheck disable=SC1091
source "tools/en/skeletonic-colors-en.sh"
source "tools/en/skeletonic-utilities-en.sh"

# skeletonicHelp: Present the Help Menu.
skeletonicHelp() {

  echo "${Green}┌───────────────────────────────────────────────────────────────────┐${Reset}" 
  echo "${Green}│                                                                   ${Green}│${Reset}"
  echo "${Green}│            ${White}💀 Skeletonic Stylus Documentation v0.0.1${Reset}              ${Green}│${Reset}"
  echo "${Green}│                                                                   ${Green}│${Reset}"
  echo "${Green}└───────────────────────────────────────────────────────────────────┘${Reset}"
  echo
  echo "${Blue}[INFO]${Reset} ${Yellow}Available options:${Reset}"
  echo "
  ${Green}[0]${Reset} Exit menu.
  ${Green}[1]${Reset} Prepare the Skeletonic documentation.
  ${Green}[2]${Reset} Install an mkdocs theme.
  ${Green}[3]${Reset} Help menu."
  echo
  echo "${Blue}[INFO]${Reset} ${Yellow}Choose an option and press [ENTER]:${Reset}"
  read -r a
    case $a in
      0) exit 0 ;;
      1) skeletonicDocs ; skeletonicHelp ;;
      2) skeletonicThemes ; skeletonicHelp ;;
      3) skeletonicHelp ;;
  *) echo "${Red}[ERROR]${Reset} Wrong option.";;
  esac
}

# skeletonicDocs: Start Documentation
skeletonicDocs () {
  cd -- "$(dirname "$0")" || exit
  sh './tools/en/skeletonic-setup-en.sh'
}

# skeletonicThemes: Start Themes
skeletonicThemes () {
  #cd -- "$(dirname "$0")" || exit
  sh './tools/en/skeletonic-themes-en.sh'
}

skeletonicHelp