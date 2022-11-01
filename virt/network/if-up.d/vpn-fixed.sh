#!/bin/bash

if [[ "$IFACE" =~ ^ppp[0-9] ]]; then
  PPP=$(ip addr show dev $IFACE | grep 'scope global')
  IP1=$(echo $PPP | awk '{ print $2 }')
  IP2=$(echo $PPP | sed -e 's@/@ @g' | awk '{ print $4 }')
  sudo ip addr del $IP1 peer $IP2 dev $IFACE
fi
