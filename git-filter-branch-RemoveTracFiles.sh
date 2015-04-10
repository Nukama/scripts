#!/bin/sh
#git log --raw |awk '/^:/ { if (! printed[$6]) { print $6; printed[$6] = 1 }}'|while read f;do if [ ! -f $f ]; then echo Deleted: $f;fi;done
git filter-branch -f -d /dev/shm/git --tree-filter "rm -f `git log --stat --author=trac --name-only --pretty=format:"" | sort -u | xargs` " --prune-empty --all
