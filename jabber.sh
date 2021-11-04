#!/usr/bin/env bash

readonly host="jabber.ru"
readonly port=5222

readonly user="$1"
readonly pass="$2"

coproc J { awk -f jabber.awk -v user="$user" -v pass="$pass"; }

<&"${J[0]}" openssl s_client -quiet \
    -starttls xmpp \
    -xmpphost "$host" \
    --connect "${host}:${port}" >&"${J[1]}"
