#!/bin/sh
git filter-branch -f -d /dev/shm/git --commit-filter '
    R=`echo "$GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL>" | git -c mailmap.blob=master:.mailmap check-mailmap --stdin`
    GIT_AUTHOR_NAME="${R% <*@*>}"
    R="${R##* <}"
    GIT_AUTHOR_EMAIL="${R%>}"
    R=`echo "$GIT_COMMITTER_NAME <$GIT_COMMITTER_EMAIL>" | git -c mailmap.blob=master:.mailmap check-mailmap --stdin`
    GIT_COMMITTER_NAME="${R% <*@*>}"
    R="${R##* <}"
    GIT_COMMITTER_EMAIL="${R%>}"
    git commit-tree "$@"
' -- --all
