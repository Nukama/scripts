#!/bin/sh
git filter-branch -f -d /dev/shm/git --index-filter 'git ls-files --stage | sed -e "s|\/|\-|g" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE" ' -- --all
