#!/bin/bash

cd /home/ger/erstiheft

local_commit=`git log --pretty=oneline -n 1 | sed "s/ .*//"`
server_commit=`git ls-remote origin -h refs/heads/master | sed "s/\t.*//"`

#echo $local_commit
#echo $server_commit

if [ "$local_commit" != "$server_commit" ]; then
  echo "hashes differ, fetching and compiling"
  git pull origin master -q
  xelatex -synctex=1 -interaction=nonstopmode --quiet erstiheft_gesamt.tex
fi

