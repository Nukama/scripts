#!/bin/sh
for i in `find . -name "*.txt" -print0 | xargs -0` ; do python ~/repositories/github.com/nipy/nipy/tools/trac2rst.py "$i" > "$i".rest; rm "$i"; done
