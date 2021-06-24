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
# Install the Material MkDocs Theme for the Skeletonic Stylus Documentation (v0.0.1).
#
# This build script has the following functions:
#
#   function themeAll ():
#     - Run all the commands chronologically.
#
#   function themeRequirements ():
#     - Install required libraries and depedencies.
#
#   function themeVersion ():
#     - Show the version of the theme and dependencies installed locally.
#
#   function themeCleanUp ():
#     - Clean up the existing theme folder.
#
#   function themeDownload ():
#     - Download the theme locally for development.
#
#   function themeMigrate ():
#     - Migrate the main theme folder for development. 
#
#   function themeRemove ():
#     - Remove the theme folder.
#
# Copyright (c) Sebastien Rousseau 2021. All rights reserved
# Licensed under the MIT license
#

# List of colors
Black='\033[0;90m'   # Black
Blue='\033[0;94m'    # Blue
Cyan='\033[0;96m'    # Cyan
Green='\033[0;92m'   # Green
Purple='\033[0;95m'  # Purple
Red='\033[0;91m'     # Red
Reset='\033[0m'      # Reset
White='\033[0;97m'   # White
Yellow='\033[0;93m'  # Yellow

# Variables
PATH="$(pwd)"
DIRECTORY=site
REPO=squidfunk
THEME=mkdocs-material
THEMEFOLDER=material

# themeAll: Run all the commands chronologically. 
function themeAll () {
  echo "${Green}[NOTES:]${Reset} External libraries and dependencies installation."
  themeRequirements
  themeVersion
  themeCleanUp
  themeDownload
  themeMigrate
  themeRemove
}

# themeRequirements: Install required libraries and depedencies.
function themeRequirements () {
  echo "${Blue}[INFO:]${Reset} Installing requirements files"
  pip install -r requirements.txt ;
}

# themeVersion: Show the version of the theme installed locally.
function themeVersion () {
  echo
  echo "Current version of \"$THEME\" installed:"
  echo
  pip freeze | grep mkdocs-material ;
  echo
}

# themeCleanUp: Clean up the existing  mkdocs-material folder.
function themeCleanUp () {
  echo
  echo "${Green}[NOTES:]${Reset} Clean up the existing website folder."
  if [ -d $DIRECTORY ]; then
    rm -rf $DIRECTORY;
    mkdir -p $DIRECTORY;
    echo "${Blue}[INFO:]${Reset} Directory \"$DIRECTORY\" cleaning has been successfully completed!"
  else 
    echo "${Red}[ERROR:]${Reset} The Directory \"$DIRECTORY\" does not exist.\n"
    exit 1;
  fi
}

# themeDownload: Downloading the theme locally for development. 
function themeDownload () {
  echo
  echo "${Green}[NOTES:]${Reset} Downloading \"$THEME\" locally for development. "
  if [[ ! -d "$THEME/" ]];then    
    echo "${Blue}[INFO:]${Reset} Creating the \"$THEME\" directory..." ;
    mkdir -p $THEME;
    cd $THEME;
    echo "${Blue}[INFO:]${Reset} Downloading the \"$THEME\"..." ;
    wget -q --no-check-certificate --content-disposition https://api.github.com/repos/$REPO/$THEME/tarball  -O $THEME.tar.gz;
    (        
        tar xzf $THEME.tar.gz --strip-components=1 ;
    )
    echo "${Blue}[INFO:]${Reset} Finished downloading and installing \"$THEME\"" ;
    else 
      echo "${Red}[ERROR:]${Reset} The Directory \"$DIRECTORY\" does not exist.\n"
      exit 1;
    fi
    exit 0;
}

# themeMigrate: Migrate the main theme folder for development. 
function themeMigrate () {
    echo "${Blue}[INFO:]${Reset} Downloading \"$THEME\"..." ;
    mv -f $THEME/$THEMEFOLDER ./ ;
}

# themeRemove: Remove the theme folder. 
function themeRemove () {
    echo "${Blue}[INFO:]${Reset} Removing \"$THEME\"..." ;
    rm -fr $THEME ;
}

# themeHelp: Present the Help Menu.
function themeHelp() {  
  echo
  echo "${Yellow}┌───────────────────────────────────────────┐${Reset}" 
  echo "${Yellow}│ ${White}💀 Skeletonic Stylus Documentation v0.0.1${Reset} ${Yellow}│${Reset}"
  echo "${Yellow}└───────────────────────────────────────────┘${Reset}"
  echo
  echo "${Blue}[INFO:]${Reset} ${Yellow}Available options:${Reset}"
  echo "
  ${Green}[0]${Reset} Exit menu.
  ${Green}[1]${Reset} Run all the commands chronologically.
  ${Green}[2]${Reset} Install the required libraries and depedencies.
  ${Green}[3]${Reset} Show the version of the theme and dependencies installed locally.
  ${Green}[4]${Reset} Clean up the existing theme folder.
  ${Green}[5]${Reset} Download the theme locally for development.
  ${Green}[6]${Reset} Migrate the main theme folder for development.
  ${Green}[7]${Reset} Remove the theme folder.
  ${Green}[8]${Reset} Help menu."
  echo
  echo "${Blue}[INFO:]${Reset} ${Yellow}Choose an option and press [ENTER]:${Reset}"
  read a
    case $a in
      0) exit 0 ;;
      1) themeAll ; themeHelp ;;
      2) themeRequirements ; themeHelp ;;
      3) themeVersion ; themeHelp ;;
      4) themeCleanUp ; themeHelp ;;
      5) themeDownload ; themeHelp ;;
      6) themeMigrate ; themeHelp ;;
      7) themeRemove ; themeHelp ;;
      8) themeHelp ;;
  *) echo "${Red}[ERROR:]${Reset} Wrong option.";;
  esac
}

themeHelp
