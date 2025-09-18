#!/bin/bash
source "$(dirname "$0")/.env"

echo url="https://www.duckdns.org/update?domains=${DUCKDNS_DOMAIN}&token=${DUCKDNS_TOKEN}&ip=" \
| curl -k -o ~/apps/duckdns/duck.log -K -

