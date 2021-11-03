#!/usr/bin/env bash

readonly host="irc.libera.chat"
readonly port=6697

coproc IRC2 { awk -f irc2.awk; }

<&"${IRC2[0]}" openssl s_client -quiet \
    --connect "${host}:${port}" >&"${IRC2[1]}" 2>/dev/null
