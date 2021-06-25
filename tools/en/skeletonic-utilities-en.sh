#
#  ____  _        _      _              _        ____
# / ___|| | _____| | ___| |_ ___  _ __ (_) ___  |  _ \  ___   ___ ___
# \___ \| |/ / _ \ |/ _ \ __/ _ \| '_ \| |/ __| | | | |/ _ \ / __/ __|
#  ___) |   <  __/ |  __/ || (_) | | | | | (__  | |_| | (_) | (__\__ \
# |____/|_|\_\___|_|\___|\__\___/|_| |_|_|\___| |____/ \___/ \___|___/
#
# Skeletonic Stylus Documentation v0.0.1
# https://docs.skeletonic.io/en

source tools/en/skeletonic-colors-en.sh
source tools/en/skeletonic-variables-en.sh

function pid () {
  eval "${1}=$(sh -c 'echo ${PPID}')"
}

function error () {
  local pid 
  local code="${3:-1}"
  pid pid
  echo "❌ [${Red}ERROR${Reset}:${Blue}${pid}${Reset}] ${Green}$(date +%F)${Reset}: ${Blue}${PROGNAME}${Reset}: ${Blue}${1}${Reset}: Exited with status ${code}.${Reset}"
  logs
  echo [ERROR:${pid}] $(date +%F): ${PROGNAME}: ${1}: Exited with status ${code}.
  exit "${code}"
}

function logs () {
  script_log="errors-`date +%F`.log"
  exec 1>>$script_log  
}
