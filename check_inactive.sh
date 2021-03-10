#!/bin/bash

INACTIVE_MINERS="$(curl -s "https://hiveon.net/eth?miner=0x0855f651Ed69B60A3104C7fd7e3FE6F8682Cf5D4" | hxnormalize | grep "Inactive" -B 3 | grep 1Apyc | cut -d '<' -f 2 | cut -d '>' -f 2)"

if [[ -n $INACTIVE_MINERS ]]
then
	/home/matt/discord_bot.sh "Miner Bot" "Miners are inactive"
fi

sleep 60
