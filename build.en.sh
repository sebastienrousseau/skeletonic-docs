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
#   function docAll ():
#     - Run all the commands chronologically.
#
#   function docRequirements ():
#     - Install required libraries and depedencies. 
#
#   function docVersion ():
#     - Show the version of `mkdocs` installed locally.
#
#   function docCleanUp ():
#     - Clean up the existing website folder.
#
#   function docBuild ():
#     - Build any localized documentation. (default english and french)
#
#   function docLeafPygment (): 
#     - Provides Leaf syntax highlighting for Pygment.
#
#   function docSite ():
#     - Prepare website folder
#
#   function docServe ():
#     - Preview the site using a local HTTP server.
#
#   function docHelp ():
#     - Present the Help Menu.
#
# Copyright (c) Sebastien Rousseau 2021. All rights reserved
# Licensed under the MIT license
#

# List of colors
Black='\033[0;90m'      # Black
Blue='\033[0;94m'       # Blue
Cyan='\033[0;96m'       # Cyan
Green='\033[0;92m'      # Green
Purple='\033[0;95m'     # Purple
Red='\033[0;91m'        # Red
Reset='\033[0m'         # Reset
White='\033[0;97m'      # White
Yellow='\033[0;93m'     # Yellow

# docAll: Run all the commands chronologically. 
function docAll () {
	docRequirements
  docVersion
  docCleanUp
  docBuild    
  docLeafPygment
  docSite
  docServe
}

# docRequirements: Install required libraries and depedencies.
function docRequirements () {
  echo
  echo "${Blue}[INFO:]${Reset} Installing requirements files"
  pip install -r requirements.txt;
  echo
}

# docVersion: Show the version of `mkdocs` installed locally.
function docVersion () {
  echo
	echo "Current Version available:"
  echo
	pip freeze | grep mkdocs
  echo
}

# docCleanUp: Clean up the existing website folder.
function docCleanUp () {
  echo
  echo "${Green}[NOTES:]${Reset} Clean up the existing website folder."
  DIRECTORY=site
  if [ -d $DIRECTORY ]; then
    rm -rf $DIRECTORY;
    mkdir -p $DIRECTORY;
    echo "${Blue}[INFO:]${Reset} Directory \"$DIRECTORY\" cleaning has been successfully completed!"
  else 
    echo "${Red}[ERROR:]${Reset} The Directory \"$DIRECTORY\" does not exist.\n"
    exit 1;
  fi
}

# docBuild: Build any localized documentation. (default english and french)
function docBuild () {
  echo
  echo "${Blue}[INFO:]${Reset} Installing the English documentation"
  cd en;
  mkdocs build;
  cd ..;
  echo
  echo "${Blue}[INFO:]${Reset} Installing the French documentation"
  cd fr;
  mkdocs build;
  cd ..;
}

# docLeafPygment: Compile leaf-pygment locally (Leaf syntax highlighting for Pygment).
function docLeafPygment () {
  echo
  echo "${Blue}[INFO:]${Reset} Installing leaf-pygment locally"
  cd leaf-pygment && ./compile.sh
  cd .. && pip install leaf-pygment/dist/leaf-4.1.2.tar.gz
  echo
}

# docSite: Prepare website folder
function docSite () {
  echo
  echo "${Blue}[INFO:]${Reset} Prepare the English website"
  mv en/site site/en;
  echo
  echo "${Blue}[INFO:]${Reset} Prepare the French website"
  mv fr/site site/fr;
  echo
  echo "<meta http-equiv=\"refresh\" content=\"0; url=/en/\">" > site/index.html;
  echo
}

# docServe: Preview the site using a local HTTP server.
function docServe () {
  
  if [ -z "$(command -v serve)" ]; then
    echo "${Red}[ERROR:]${Reset} You are missing the package 'serve'.";
    echo "${Blue}[INFO:]${Reset} Simply install the package using the Yarn Package Manager";
    echo "yarn global add serve" | pbcopy;
    echo "$(pbpaste)"
    exit 1;
  fi
  
  echo
	echo "Starting Serve Mode:"
  serve -p 8000 site
  echo
}

# docHelp: Present the Help Menu.
function docHelp() {  
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
  ${Green}[3]${Reset} Show the version of mkdocs and dependencies installed locally.
  ${Green}[4]${Reset} Clean up the existing website folder.
  ${Green}[5]${Reset} Build the localized documentation (Default settings assume English and French locales).
  ${Green}[6]${Reset} Compile leaf-pygment locally (Leaf syntax highlighting for Pygment).
  ${Green}[7]${Reset} Prepare the Site folder.
  ${Green}[8]${Reset} Preview the Site using the local HTTP server (serve).
  ${Green}[9]${Reset} Help menu."
  echo
  echo "${Blue}[INFO:]${Reset} ${Yellow}Choose an option and press [ENTER]:${Reset}" 
  read a
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
      9) docHelp ; docHelp ;;      
  *) echo "${Red}[ERROR:]${Reset} Wrong option.";;
  esac
}

docHelp