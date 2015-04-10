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
layout: "doc"
title: "$title"
permalink: "/doc/$filepath/"
redirect-from: "/wiki/$filepath/"
---
" | cat - $1
