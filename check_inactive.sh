#!/bin/bash

WALLET_ADDR=""

WALLET_ADDR_FIXED="$(echo $WALLET_ADDR | cut -c 3- | tr '[:upper:]' '[:lower:]')"

INACTIVE_MINERS="$(http "https://hiveon.net/api/v1/stats/miner/$WALLET_ADDR_FIXED/ETH" | jq .offlineWorkerCount | cut -d '"' -f 2)"

if [[ $INACTIVE_MINERS -gt 0 ]]
then
	/home/matt/discord_bot.sh "Miner Bot" "$INACTIVE_MINERS miners are inactive"
fi

sleep 60
