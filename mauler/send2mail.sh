#!/usr/bin/env bash

if [ -z $1 ]; then
  echo Usage:
  echo $0 johndoe@zux.com
  exit 1
fi

mkdir -p outbox/

awk -f mutt.awk -v email="$1" | xargs -0 -I{} sh -c "{}"
