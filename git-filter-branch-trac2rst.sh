#!/bin/sh
git filter-branch -f --tree-filter "~/repositories/github.com/Nukama/scripts/trac2rst.sh
" -- --all
