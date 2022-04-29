#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
  echo $0 missing argument path.
  exit 1
fi

mkdir -p inbox/

name=${2:-"*.pdf"}

path=$(realpath "$1")

while IFS= read -r -d $'\0' filepath; do
  filename="${filepath##*/}"

  if [ ! -e "outbox/$filename" ]; then
     target="inbox/$filename"
     if [ ! -e "$target" ]; then
        ln -s "$filepath" "$target"
        echo "Added: $target"
     else
       echo "warn: $filename already collected."
     fi
  fi
done  < <(find "$path" -type f -name "$name" -print0)

