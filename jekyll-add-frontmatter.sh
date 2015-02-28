#!/bin/sh
#
# Prepend a frontmatter to stdout based on file $1.
#

title=`basename "$1" | cut -d. -f1`
#filename=`rev <<< "$1" | cut -d"." -f2- | rev`
#fileext=`rev <<< "$1" | cut -d"." -f1 | rev`
filepath=`rev <<< "$1" | cut -d"." -f2- | rev | sed -e "s|\.\/||g"`

echo \
"---
title: "$title"
permalink: /wiki/$filepath
---
" | cat - $1