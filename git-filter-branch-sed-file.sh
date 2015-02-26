#!/bin/sh
#git filter-branch -f -d /dev/shm/git --tree-filter 'find . -type f -print | xargs sed -i '' -e 's/\{\{\{/\'\'\'/g' ' -- --all
#git filter-branch --tree-filter -f  'sed -i "/sensitive information/ d" filename' -- --all
git filter-branch --tree-filter -d /dev/shm/git -f 'git ls-files -z "*.txt" | xargs -0 perl -p -i -e "s#({{{)#(```)#g"' -- --all

