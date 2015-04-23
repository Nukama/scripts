#!/bin/sh
git filter-branch -f -d /dev/shm/git --tree-filter "python ~/repositories/github.com/woju/qubesos.github.io/_utils/fix_zwsp.py" -- --all
