#!/bin/sh
#git log --raw |awk '/^:/ { if (! printed[$6]) { print $6; printed[$6] = 1 }}'|while read f;do if [ ! -f $f ]; then echo Deleted: $f;fi;done
#git filter-branch -f -d /dev/shm/git --tree-filter "~/repositories/github.com/Nukama/scripts/ConvertFromTrac.sh" --prune-empty -- --all

git filter-branch -f -d /dev/shm/git --force \
--index-filter 'git rm -rf --cached --ignore-unmatch Dom0SecureUpdate\:.md amChartTest.md' \
--prune-empty --tag-name-filter cat -- --all

rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now
