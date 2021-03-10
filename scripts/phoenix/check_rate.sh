#!/bin/bash

URL="ADD_PHOENIX_URL_HERE"
DISCORD_SCRIPT="DISCORD_SCRIPT_LOCATION"

POWER="$(curl -s $URL | grep 'GPUs power:' | tail -n 1  | cut -d ' ' -f 3-4 | cut -d '<' -f 1)"
HASHRATE="$(curl -s $URL | grep 'Eth speed:' | tail -n 1 | cut -d ' ' -f 4-5 | cut -d ',' -f 1)"

#echo "$POWER"
#echo "$HASHRATE"

$DISCORD_SCRIPT "Miner Bot" "R9390 #2 mining at $HATERATE using $POWER"
