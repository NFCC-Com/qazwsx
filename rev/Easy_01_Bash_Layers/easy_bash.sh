#!/usr/bin/env bash
set -euo pipefail

expected='9AGosOUZ0A3K0OwoskTokp3KmW3Z5EQosu2p0V2rLMxG'

check() {
    local flag="$1"
    local a b c
    a=$(printf '%s' "$flag" | base64 -w0)
    b=$(printf '%s' "$a" | rev)
    c=$(printf '%s' "$b" | tr 'A-Za-z' 'N-ZA-Mn-za-m')
    [[ "$c" == "$expected" ]]
}

if [[ $# -ge 1 ]]; then
    flag="$1"
else
    read -r -p "Flag: " flag
fi

if check "$flag"; then
    echo "Correct! Layer demi layer."
else
    echo "Wrong!"
fi
