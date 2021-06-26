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
source tools/en/skeletonic-colors-en.sh
source tools/en/skeletonic-utilities-en.sh

# Create the setup function
function setup (){
	if [ -f ./tools/en/skeletonic-docs-en.sh ]; then
		./tools/en/skeletonic-docs-en.sh
	else
  	error "$LINENO: File \"${0}\" not found. Check the file name and try again. "
  fi
}

# Call the setup function
setup