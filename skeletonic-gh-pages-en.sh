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
# Deployment script to push site content to the gh-pages branch.
#
# This deployment script has the following functions:
#
#   deployAll ():
#     - Run all the commands chronologically.
#
#   deployCommit ():
#     - Getting the latest commit in main branch.
#
#   deployClone ():
#     - Cloning the remote site gh-pages branch.
#
#   deployCleanGHP ():
#     - Cleanup the previous gh-pages content.
#
#   deployCNAME ():
#     - Add CNAME to the gh-pages folder.
#
#   deployNewContent ():
#     - Switching directory to gh-pages and adding new content.
#
#   deployCommitMsg ():
#     - Defining the commit message.
#
#   deployAdd (): 
#     - Add new or changed files in site working directory to the Git staging area.
#
#   deployCommitChanges ():
#     - Commit the changes to the to gh-pages branch.
#
#   deployPush ():
#     - Push the changes to the gh-pages branch.
#
#   deployCleanup ():
#     - Cleanup deployment artefacts.
#
#   deployHelp ():
#     - Present the Help Menu.
#
# Copyright (c) Sebastien Rousseau 2021. All rights reserved
# Licensed under the MIT license
#

# Load configuration files
# shellcheck disable=SC2154
# shellcheck disable=SC3046
# shellcheck disable=SC1091
source "tools/en/skeletonic-colors-en.sh"
source "tools/en/skeletonic-utilities-en.sh"
source "tools/en/skeletonic-variables-en.sh"

# 1) deployAll: Run all the commands chronologically.
deployAll () {
  echo "${Yellow}[WARNING]${Reset} Run all the commands chronologically."    
	deployCommit
  deployClone
  deployCleanGHP
  deployCNAME
  deployNewContent
  deployCommitMsg    
  deployAdd
  deployCommitChanges
  deployPush
  deployCleanup
}

# 2) deployCommit: Getting the latest commit in main branch.
deployCommit () {
  echo
  echo "${Blue}[INFO]${Reset} Getting the latest commit in main branch."
  commit=$(git log -n 1 --pretty='format:%C(auto)%h (%s, %ad)')
  echo "[Commit]: ${commit}"
  echo
}

# 3) deployClone: Cloning the remote site gh-pages branch.
deployClone () {
  echo
  echo "${Blue}[INFO]${Reset} Cloning the remote site gh-pages branch."
  git clone -b gh-pages https://github.com/sebastienrousseau/skeletonic-docs.git gh-pages
  echo
}

# 4) deployCleanGHP: Cleanup the previous gh-pages content.
deployCleanGHP () {
  echo
  echo "${Blue}[INFO]${Reset} Cleanup the previous gh-pages content."
  cd gh-pages/ || exit
  rm -fr ./*
  cd .. 
  echo
}

# 5) deployCNAME: Add CNAME to the gh-pages folder.
deployCNAME () {
  echo
  echo "${Blue}[INFO]${Reset} Add CNAME to the gh-pages folder."
  cp -f CNAME gh-pages/
  echo
}

# 6) deployNewContent: Switching directory to gh-pages and adding new content.
deployNewContent () {
  echo
  echo "${Blue}[INFO]${Reset} Switching directory to gh-pages and adding new content."
  cd gh-pages || exit
  cp -r ../site/ .
  echo
}

# 7) deployCommitMsg: Defining the commit message.
deployCommitMsg () {
  echo
  echo "${Blue}[INFO]${Reset} Defining the commit message"
  message="Deploying commit $commit to gh-pages"
  echo "[Warning]: ${message}."
  echo
}

# 8) deployAdd: Add new or changed files in site working directory to the Git staging area.
deployAdd () {
  echo
  echo "${Blue}[INFO]${Reset} Add new or changed files in site working directory to the Git staging area."
  git add .
  echo
}

# 9) deployCommitChanges: Commit the changes to the to gh-pages branch.
deployCommitChanges () {
  echo
  echo "${Blue}[INFO]${Reset} Commit the changes to the to gh-pages branch"
  git commit -m "$message" > /dev/null 2>&1
  echo
}

# 10) deployPush: Push the changes to the gh-pages branch.
deployPush () {
  echo
  echo "${Blue}[INFO]${Reset} Push the changes to the gh-pages branch."
  git push origin gh-pages
  echo "[Success]: Deployment successful of v1.0.$VERSION to gh-pages"
  echo
}

# 11) deployCleanup: Cleanup deployment artefacts.
deployCleanup () {
  echo
  echo "${Blue}[INFO]${Reset} Cleanup deployment artefacts"
  rm -rf gh-pages/
  echo
}

# 12) deployHelp: Present the Help Menu.
deployHelp() {  
  echo
  echo "${Green}   ┌ ${Green}Skeletonic Stylus${Reset} ${Green}────────────────────────────────┐${Reset}" 
  echo "${Green}   │                                                   │${Reset}" 
  echo "${Green}   │ ${Green}  Deployment scripts!${Reset}                             ${Green}│${Reset}" 
  echo "${Green}   │                                                   │${Reset}" 
  echo "${Green}   └───────────────────────────────────────────────────┘${Reset}"
  echo
  echo "${Blue}[INFO]${Reset} ${White}Available options:${Reset}"
  echo "
  ${Green}[0]${Reset}   Exit menu.
  ${Green}[1]${Reset}   Run all the commands chronologically.
  ${Green}[2]${Reset}   Getting the latest commit in main branch.
  ${Green}[3]${Reset}   Cloning the remote site gh-pages branch.
  ${Green}[4]${Reset}   Cleanup the previous gh-pages content.
  ${Green}[5]${Reset}   Add CNAME to the gh-pages folder.
  ${Green}[6]${Reset}   Switching directory to gh-pages and adding new content.
  ${Green}[7]${Reset}   Defining the commit message.
  ${Green}[8]${Reset}   Add new or changed files in site working directory to the Git staging area.
  ${Green}[9]${Reset}   Commit the changes to the to gh-pages branch.
  ${Green}[10]${Reset}   Push the changes to the gh-pages branch.
  ${Green}[11]${Reset}  Cleanup deployment artefacts.
  ${Green}[12]${Reset}  Help menu."
  echo
  echo "${Blue}[INFO]${Reset} ${Yellow}Choose an option and press [ENTER]:${Reset}" 
  read -r a
    case $a in
      0) exit 0 ;;
      1) deployAll ; deployHelp ;;   
      2) deployCommit ; deployHelp ;;
      3) deployClone ; deployHelp ;;
      4) deployCleanGHP ; deployHelp ;;
      5) deployCNAME ; deployHelp ;;
      6) deployNewContent ; deployHelp ;;   
      7) deployCommitMsg ; deployHelp ;;
      8) deployAdd ; deployHelp ;;
      9) deployCommitChanges ; deployHelp ;;
      10) deployPush ; deployHelp ;;   
      11) deployCleanup ; deployHelp ;;
      12) deployHelp ;;
  *) echo "${Red}[ERROR]${Reset} Wrong option.";;
  esac
}

deployHelp
