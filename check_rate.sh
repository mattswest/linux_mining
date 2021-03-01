#!/bin/bash

URL="http://192.168.86.55:30800/"

POWER="$(curl -s $URL | grep 'GPUs power:' | tail -n 1  | cut -d ' ' -f 3-4 | cut -d '<' -f 1)"
HASHRATE="$(curl -s $URL | grep 'Eth speed:' | tail -n 1 | cut -d ' ' -f 4-5 | cut -d ',' -f 1)"

#echo "$POWER"
#echo "$HASHRATE"

/home/matt/discord_bot.sh "Miner Bot" "R9390 #2 mining at $HATERATE using $POWER"
