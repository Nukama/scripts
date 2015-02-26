#!/bin/sh
for file in *.txt ; do ~/repositories/github.com/nipy/nipy/tools/trac2rst.py $file > $file.rest ; done
