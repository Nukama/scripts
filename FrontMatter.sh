#!/bin/sh
for i in `find . -name "*.md" -print0 | xargs -0` ; do ~/repositories/github.com/Nukama/scripts/jekyll-add-frontmatter.sh "$i" > "$i".fm ; mv "$i".fm "$i" ; done
