#!/bin/sh
#git log --raw |awk '/^:/ { if (! printed[$6]) { print $6; printed[$6] = 1 }}'|while read f;do if [ ! -f $f ]; then echo Deleted: $f;fi;done
git filter-branch -f --tree-filter "rm -f `cat toberemoved.txt`" -- --all
