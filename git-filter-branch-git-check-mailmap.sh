#!/bin/sh
git filter-branch -f -d /dev/shm/git --commit-filter '
    R=`echo "$GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL>" | git -c mailmap.file=/home/user/repositories/github.com/Nukama/scripts/.mailmap check-mailmap --stdin`
    GIT_AUTHOR_NAME="${R% <*@*>}"
    GIT_COMMITTER_NAME="${R% <*@*>}"
    R="${R##* <}"
    GIT_AUTHOR_EMAIL="${R%>}"
    GIT_COMMITTER_EMAIL="${R%>}"
    GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE
    git commit-tree "$@"
' -- --all
