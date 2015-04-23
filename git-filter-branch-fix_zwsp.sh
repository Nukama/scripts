#!/bin/sh
git filter-branch -f -d /dev/shm/git --tree-filter "for i in `find . -name "*.md" -print0 | xargs -0` ; do python ~/repositories/github.com/woju/qubesos.github.io/_utils/fix_zwsp.py "$i"; done" -- --all
