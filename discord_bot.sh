#!/bin/bash

WEBHOOK_URL=""

http -j post $WEBHOOK_URL username="$1" content="$2"
