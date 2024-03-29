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
#
# Install MkDocs Themes for the Skeletonic Stylus Documentation (v0.0.1).
#
# This build script has the following functions:
#
#   themeAll ():
#     - Run all the commands chronologically.
#
#   themeRequirements ():
#     - Install required libraries and dependencies.
#
#   themeVersion ():
#     - Show the version of the theme and dependencies installed locally.
#
#   themeCleanUp ():
#     - Clean up the existing theme folder.
#
#   themeSource ():
#     - Download the theme locally for development.
#
#   themeExtract ():
#     - Extract the main theme folder for development. 
#
#   themeRemove ():
#     - Remove the theme folder.
#
# Copyright (c) Sebastien Rousseau 2021. All rights reserved
# Licensed under the MIT license
#

# Load configuration files
# shellcheck disable=SC2154
# shellcheck disable=SC2002
# shellcheck disable=SC3000-SC4000
# shellcheck disable=SC1091
source "tools/en/skeletonic-colors-en.sh"
source "tools/en/skeletonic-utilities-en.sh"
source "tools/en/skeletonic-variables-en.sh"

# themeAll: Run all the commands chronologically. 
themeAll () {
  echo "${Yellow}[WARNING]${Reset} External libraries and dependencies installation."
  themeRequirements
  themeVersion
  themeCleanUp
  themeSource
  themeExtract
  themeRemove
}

# themeRequirements: Install required libraries and dependencies.
themeRequirements () {
  echo "${Blue}[INFO]${Reset} Installing requirements files"
  pip install -r "$TOOLS/$REQUIREMENTS";
}

# themeVersion: Show the version of the theme installed locally.
themeVersion () {
  echo
  echo "Current version of $THEME installed:"
  echo
  pip freeze | grep mkdocs-material ;
  echo
}

# themeCleanUp: Clean up the existing mkdocs-material folder.
themeCleanUp () {
  echo
  echo "${Yellow}[WARNING]${Reset} Clean up the existing theme folder."
  if [ -d "$THEMEFOLDER" ]; then
    rm -rf "$THEMEFOLDER";
    echo "${Blue}[INFO]${Reset} Directory $THEMEFOLDER cleaning has been successfully completed!"
  else 
    error "$LINENO: The Directory $THEMEFOLDER does not exist."
    exit 1;
  fi
}

# themeSource: Downloading the source theme locally for development. 
themeSource () {
  echo
  echo "${Yellow}[WARNING]${Reset} Downloading $THEME locally for development. "
  if [ ! -d "$THEME/" ];then    
    echo "${Blue}[INFO]${Reset} Creating the $THEME directory..." ;
    mkdir -p "$THEME";
    cd "$THEME" || exit;
    echo "${Blue}[INFO]${Reset} Downloading the $THEME..." ;
    wget -q --no-check-certificate --content-disposition https://api.github.com/repos/"$REPO"/"$THEME"/tarball  -O "$THEME".tar.gz;
    (        
        tar xzf "$THEME".tar.gz --strip-components=1 ;
    )
    echo "${Blue}[INFO]${Reset} Finished downloading and installing $THEME" ;
    else 
      echo "${Red}[ERROR]${Reset} The Directory $DIRECTORY does not exist."
      exit 1;
    fi
    exit 0;
}

# themeExtract: Extract the main theme folder for development. 
themeExtract () {
    echo "${Blue}[INFO]${Reset} Extracting $THEME..." ;
    cp -fr "$THEME/$THEMEFOLDER" ./ ;
}

# themeRemove: Remove the source theme folder. 
themeRemove () {
    echo "${Blue}[INFO]${Reset} Removing $THEME..." ;
    rm -fr "$THEME" ;
}

# themeHelp: Present the Help Menu.
themeHelp() {  
  echo
  echo "${Blue}┌ ${White}Skeletonic Stylus${Reset} ${Blue}───────────────┐${Reset}" 
  echo "${Blue}│                                  │${Reset}" 
  echo "${Blue}│ ${White}Highly customized mkdocs themes${Reset}  ${Blue}│${Reset}" 
  echo "${Blue}│                                  │${Reset}" 
  echo "${Blue}└──────────────────────────────────┘${Reset}" 
  echo " 
  ${Green}[0]${Reset} Exit menu.
  ${Green}[1]${Reset} Run all the commands chronologically.
  ${Green}[2]${Reset} Install the required libraries and dependencies.
  ${Green}[3]${Reset} Show the version of the theme and dependencies installed locally.
  ${Green}[4]${Reset} Clean up the existing theme folder.
  ${Green}[5]${Reset} Download the source theme locally for development.
  ${Green}[6]${Reset} Extract the main theme folder for development.
  ${Green}[7]${Reset} Remove the source theme folder.
  ${Green}[8]${Reset} Help menu."
  echo
  echo "${Blue}[INFO]${Reset} ${Yellow}Choose an option and press [ENTER]:${Reset}"
  read -r a
    case $a in
      0) exit 0 ;;
      1) themeAll ; themeHelp ;;
      2) themeRequirements ; themeHelp ;;
      3) themeVersion ; themeHelp ;;
      4) themeCleanUp ; themeHelp ;;
      5) themeSource ; themeHelp ;;
      6) themeExtract ; themeHelp ;;
      7) themeRemove ; themeHelp ;;
      8) themeHelp ;;
  *) echo "${Red}[ERROR]${Reset} Wrong option.";;
  esac
}

themeHelp
