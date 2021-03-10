#!/bin/bash

WALLET_ADDR=""

WALLET_ADDR_FIXED="$(echo $WALLET_ADDR | cut -c 3- | tr '[:upper:]' '[:lower:]')"

ACTIVE_MINERS="$(http "https://hiveon.net/api/v1/stats/miner/$WALLET_ADDR_FIXED/ETH" | jq .onlineWorkerCount | cut -d '"' -f 2)"

if [[ $ACTIVE_MINERS -gt 0 ]]
then
	/home/matt/discord_bot.sh "Miner Bot" "$ACTIVE_MINERS miners are active"
fi

sleep 60
