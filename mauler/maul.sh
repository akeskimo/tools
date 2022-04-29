#!/usr/bin/env bash

# Process all links from inbox and send source files as attachments
# to given email address.

if [ -z $1 ]; then
  echo Usage:
  echo $0 johndoe@zux.com
  exit 1
fi

files=$(find inbox/ -type l -exec readlink {} \;)

if [ -z "$files" ]; then
  echo "Inbox is empty. You should collect files to send, first."
  exit 0
fi

nfiles=$(echo $files | wc -l)

while true; do
    read -p "Commit $nfiles file(s) outbox to be sent to $1 (y/n/l)? " yn
    case $yn in
        [Yy]* ) break;;
        [Ll]* ) echo $files;;
        [Nn]* ) echo "Aborted."; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo $files | ./send2mail.sh $1
