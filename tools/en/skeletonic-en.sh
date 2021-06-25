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
	echo
	echo "${Blue}[INFO]${Reset} Preparing the English documentation..."
	./tools/en/skeletonic-docs-en.sh
	echo
}

# Call the setup function
setup