#!/bin/sh
git filter-branch -f -d /dev/shm/git --tree-filter "~/repositories/github.com/Nukama/scripts/FrontMatter.sh" -- --all
