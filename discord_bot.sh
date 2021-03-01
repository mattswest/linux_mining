#!/bin/bash

WEBHOOK_URL="ADD_DISCORD_WEBHOOK_URL_HERE"

http -j post $WEBHOOK_URL username="$1" content="$2"
