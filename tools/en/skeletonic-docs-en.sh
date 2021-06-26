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
# Build scripts for the Skeletonic Stylus Documentation (v0.0.1).
#
# This build script has the following functions:
#
#   docAll ():
#     - Run all the commands chronologically.
#
#   docRequirements ():
#     - Install required libraries and dependencies 
#
#   docVersion ():
#     - Show the version of mkdocs installed locally.
#
#   docCleanUp ():
#     - Clean up the existing website folder.
#
#   docBuild ():
#     - Build any localized documentation. (default english and french)
#
#   docLeafPygment (): 
#     - Provides Leaf syntax highlighting for Pygment.
#
#   docSite ():
#     - Prepare website folder
#
#   docServe ():
#     - Preview the site using a local HTTP server.
#
#   docHelp ():
#     - Present the Help Menu.
#
# Copyright (c) Sebastien Rousseau 2021. All rights reserved
# Licensed under the MIT license
#

# Load configuration files
source "tools/en/skeletonic-colors-en.sh"
source "tools/en/skeletonic-variables-en.sh"
source "tools/en/skeletonic-utilities-en.sh"

# docAll: Run all the commands chronologically.
docAll () {
  echo "${Yellow}[WARNING]${Reset} External libraries and dependencies installation."    
	docRequirements
  docVersion
  docCleanUp
  docBuild    
  docLeafPygment
  docSite
  docServe
}

# docRequirements: Install required libraries and dependencies
docRequirements () {
  echo
  echo "${Blue}[INFO]${Reset} Installing requirements files"
  pip install -r "$SKLPATH/requirements.txt" ;
  echo
}

# docVersion: Show the version of mkdocs installed locally.
docVersion () {
  echo
	echo "Current version of mkdocs available is:"
  echo
	pip freeze | grep mkdocs
  echo
}

# docCleanUp: Clean up the existing website folder.
docCleanUp () {
  echo
  echo "${Yellow}[WARNING]${Reset} Clean up the existing website folder."
  if [ -d "$DIRECTORY" ]; then
    rm -rf "$DIRECTORY";
    mkdir -p "$DIRECTORY";
    echo "${Blue}[INFO]${Reset} Directory $DIRECTORY cleaning has been successfully completed!"
  else 
    echo "${Red}[ERROR]${Reset} The Directory $DIRECTORY does not exist."
    return;
  fi
}

# docBuild: Build any localized documentation. (default english and french)
docBuild () {
  echo
  echo "${Blue}[INFO]${Reset} Installing the English documentation"
  cd en || exit;
  mkdocs build;
  cd ..;
  echo
  echo "${Blue}[INFO]${Reset} Installing the French documentation"
  cd fr || exit;
  mkdocs build;
  cd ..;
}

# docLeafPygment: Compile leaf-pygment locally (Leaf syntax highlighting for Pygment).
docLeafPygment () {
  echo
  echo "${Blue}[INFO]${Reset} Installing leaf-pygment locally"
  #cd leaf-pygment && ./compile.sh
  #cd .. && pip install leaf-pygment/dist/leaf-4.1.2.tar.gz
  echo
}

# docSite: Prepare website folder
docSite () {
  echo
  echo "${Blue}[INFO]${Reset} Prepare the English website"
  mv en/site site/en;
  echo
  echo "${Blue}[INFO]${Reset} Prepare the French website"
  mv fr/site site/fr;
  echo
  echo "<meta http-equiv=\"refresh\" content=\"0; url=/en/\">" > site/index.html;
  echo
}

# docServe: Preview the site using a local HTTP server.
docServe () {
  
  if [ -z "$(command -v serve)" ]; then
    echo "${Red}[ERROR]${Reset} You are missing the package 'serve'.";
    echo "${Blue}[INFO]${Reset} Simply install the package using the Yarn Package Manager";
    echo "yarn global add serve" | pbcopy;
    pbpaste; echo
    exit 1;
  fi
  
  echo
	echo "Starting Serve Mode:"
  serve -p 8000 site/
  echo
}

# docHelp: Present the Help Menu.
docHelp() {  
  echo
  echo "${Blue}┌ ${White}Skeletonic Stylus${Reset} ${Blue}───────────────┐${Reset}" 
  echo "${Blue}│                                  │${Reset}" 
  echo "${Blue}│ ${White}Online documentation generator ${Reset}  ${Blue}│${Reset}" 
  echo "${Blue}│                                  │${Reset}" 
  echo "${Blue}└──────────────────────────────────┘${Reset}" 
  echo
  echo "${Blue}[INFO]${Reset} ${White}Available options:${Reset}"
  echo "
  ${Green}[0]${Reset} Exit menu.
  ${Green}[1]${Reset} Run all the commands chronologically.
  ${Green}[2]${Reset} Install the required libraries and dependencies
  ${Green}[3]${Reset} Show the version of mkdocs and dependencies.
  ${Green}[4]${Reset} Clean up the existing website folder.
  ${Green}[5]${Reset} Build the localized documentation.
  ${Green}[6]${Reset} Compile leaf-pygment locally.
  ${Green}[7]${Reset} Prepare the site folder.
  ${Green}[8]${Reset} Preview site.
  ${Green}[9]${Reset} Help menu."
  echo
  echo "${Blue}[INFO]${Reset} ${Yellow}Choose an option and press [ENTER]:${Reset}" 
  read -r a
    case $a in
      0) exit 0 ;;
      1) docAll ; docHelp ;;
      2) docRequirements ; docHelp ;;
      3) docVersion ; docHelp ;;
      4) docCleanUp ; docHelp ;;
      5) docBuild ; docHelp ;;
      6) docLeafPygment ; docHelp ;;
      7) docSite ; docHelp ;;
      8) docServe ; docHelp ;;
      9) docHelp ;;      
  *) echo "${Red}[ERROR]${Reset} Wrong option.";;
  esac
}

docHelp