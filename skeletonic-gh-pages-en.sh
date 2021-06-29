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
# A script to generate site and push it to the gh-pages branch
#

version=(" $(git rev-parse --short HEAD) ")

# Remove the current content of the site folder
# cp -rf site

# Get the latest commit in main branch
commit=$(git log -n 1 --pretty='format:%C(auto)%h (%s, %ad)')
echo "[Commit]: ${commit}"

# Clone remote site branch 
git clone -b gh-pages "git config remote.origin.url" gh-pages

# Build Production site
#cd en || exit;
#mkdocs build;
#cd ..;
#cd fr || exit;
#mkdocs build;
#cd ..;

# Switch directory to site
cd site || exit

# Define the commit message
message="Deploying commit $commit to gh-pages"
echo "[Warning]: ${message}."

# Add new or changed files in site working directory to the Git staging area.
git add .

# Commit the changes to the to gh-pages branch
git commit -m "$message" > /dev/null 2>&1

# Push the changes to the to gh-pages branch
git push > /dev/null 2>&1
if [ $? = 0 ]; then
  echo "[Success]: Deployment successful of v1.0.$version to gh-pages"
else
  echo "[Error]: Deployment failure of v1.0.$version to gh-pages"
fi