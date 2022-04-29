#!/usr/bin/awk -f

function boxpath(boxname, path) {
  sub(".*/", "", path)
  path = boxname "/" path
  return path
}

function path2title(path) {
  sub(".*/", "", path)
  gsub("_", " ", path)
  gsub(".([a-z]+)$", "", path)
  return path
}

!system("test -e " boxpath("outbox", $1) )==0 { print "mutt -s \42" path2title($1) "\42 " (email == "" ? "johndoe@xyz.com" : email) " -a " $1 " && ln -sf " $1 " " boxpath("outbox", $1) ";rm -f " boxpath("inbox", $1) "\0" }
