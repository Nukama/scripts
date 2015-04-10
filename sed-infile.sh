#!/bin/sh
# Fix highlight with jekyll pygments highlighter (kramdown)
# more lexers at http://pygments.org/docs/lexers/
for i in `find . -name "*.md" -print0 | xargs -0` ; do sed -e 's/``` {.wiki}/{% highlight trac-wiki %}/g' "$i" > "$i".tmp ; mv "$i".tmp "$i"; done
for i in `find . -name "*.md" -print0 | xargs -0` ; do perl -i -p -e 's/```\n/{% endhighlight %}\n/' "$i"; done

#Change layout to doc
for i in `find . -name "*.md" -print0 | xargs -0` ; do sed -e s/layout\:\ wiki/layout\:\ doc/g "$i" > "$i".tmp ; mv "$i".tmp "$i"; done
# Move permalink entry to redirect_from
# First remove FrontMatter
for i in `find . -name "*.md" -print0 | xargs -0` ; do sed -i '1d' "$i"; done
for i in `find . -name "*.md" -print0 | xargs -0` ; do sed -i '1,/---/d' "$i"; done
for i in `find . -name "*.md" -print0 | xargs -0` ; do sed -i '1d' "$i"; done
for i in `find . -name "*.md" -print0 | xargs -0` ; do ~/repositories/github.com/Nukama/scripts/jekyll-add-frontmatter.sh "$i" > "$i".fm ; mv "$i".fm "$i" ; done
#for i in `find . -name "*.md" -print0 | xargs -0` ; do sed -i 's/permalink\:\ \/wiki\//redirect_from\:\ \/wiki\//' "$i"; done
#for i in `find . -name "*.md" -print0 | xargs -0` ; do sed -e 's/\: \/wiki/\: \/doc/g' "$i" > "$i".tmp ; mv "$i".tmp "$i"; done
