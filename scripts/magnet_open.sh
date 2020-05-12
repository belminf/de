#!/usr/bin/env bash

# Break on error
set -e

# Get import dir
SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Source shared files
source "${SCRIPT_DIR}/../.environment"

# Environment variables needed:
: "${TRANSMISSION_HOST:=localhost:9091}"
: "${TRANSMISSION_USER:=transmission}"
: "${TRANSMISSION_PASS:?Need to set RPC password}"
: "${TRANSMISSION_DL_DIRS:?Need to set download directory}"

# Make sure magnet link sent
: "${1?"Usage: $0 <magnet link>"}"

MAGNET_LINK="$1"

# Get target dir
target_dl_dir="$(zenity --list --title "Add Torrent" --text "Save Torrent To:" --column "Directories" "${TRANSMISSION_DL_DIRS[@]}")" || exit 0

# Exit if we didn't select a download dir
[ -z "$target_dl_dir" ] && exit 0

# Get session ID
SESSION_ID=$(curl --silent --user "${TRANSMISSION_USER}:${TRANSMISSION_PASS}" "http://${TRANSMISSION_HOST}/transmission/rpc" | sed 's/.*\(X-Transmission-Session-Id: [[:alnum:]]\+\).*$/\1/')

# Submit Magnet link
RETURN_JSON="$(curl --silent --user "${TRANSMISSION_USER}:${TRANSMISSION_PASS}" -H "${SESSION_ID}" "http://${TRANSMISSION_HOST}/transmission/rpc" -d '{"method":"torrent-add","arguments":{"paused":false,"download-dir":"'"${target_dl_dir}"'","filename":"'"${MAGNET_LINK}"'"}}')"

# Notify
# shellcheck disable=SC2001
notify-send --app-name="Transmission" "RPC call" "$(echo "${RETURN_JSON}" | sed 's/{"arguments":{"\([^"]\+\)".*"name":"\([^"]\+\)".*"result":"\([^"]\+\)".*$/\1 (\3): \2/')"
