#!/bin/sh
git filter-branch -f -d /dev/shm/git --env-filter '
an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

if [ "$GIT_AUTHOR_NAME" = "joanna" ]
then
    cn="Joanna Rutkowska"
    cm="joanna@invisiblethingslab.com"
fi
if [ "$GIT_AUTHOR_NAME" = "joanna" ]
then
    an="Joanna Rutkowska"
    am="joanna@invisiblethingslab.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

if [ "$GIT_AUTHOR_NAME" = "marmarek" ]
then
    cn="Marek Marczykowski-Górecki"
    cm="marmarek@invisiblethingslab.com"
fi
if [ "$GIT_AUTHOR_NAME" = "marmarek" ]
then
    an="Marek Marczykowski-Górecki"
    am="marmarek@invisiblethingslab.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#    148  trac
if [ "$GIT_AUTHOR_NAME" = "trac" ]
then
    cn="trac"
    cm=""
fi
if [ "$GIT_AUTHOR_NAME" = "trac" ]
then
    an="trac"
    am=""
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#    139  axon -> Axon <axon@openmailbox.org>
if [ "$GIT_AUTHOR_NAME" = "axon" ]
then
    cn="Axon"
    cm="axon@openmailbox.org"
fi
if [ "$GIT_AUTHOR_NAME" = "axon" ]
then
    an="Axon"
    am="axon@openmailbox.org"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#    121  Zrubi -> Zrubecz Laszlo <mail@zrubi.hu>
if [ "$GIT_AUTHOR_NAME" = "Zrubi" ]
then
    cn="Zrubecz Laszlo"
    cm="mail@zrubi.hu"
fi
if [ "$GIT_AUTHOR_NAME" = "Zrubi" ]
then
    an="Zrubecz Laszlo"
    am="mail@zrubi.hu"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     99  Nukama -> Hakisho Nukama <nukama@gmail.com>
if [ "$GIT_AUTHOR_NAME" = "Nukama" ]
then
    cn="Hakisho Nukama"
    cm="nukama@gmail.com"
fi
if [ "$GIT_AUTHOR_NAME" = "Nukama" ]
then
    an="Hakisho Nukama"
    am="nukama@gmail.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     45  rafal -> Rafal Wojtczuk <rafal@invisiblethingslab.com>
if [ "$GIT_AUTHOR_NAME" = "rafal" ]
then
    cn="Rafal Wojtczuk"
    cm="rafal@invisiblethingslab.com"
fi
if [ "$GIT_AUTHOR_NAME" = "rafal" ]
then
    an="Rafal Wojtczuk"
    am="rafal@invisiblethingslab.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     29  oliv
if [ "$GIT_AUTHOR_NAME" = "oliv" ]
then
    cn="oliv"
    cm=""
fi
if [ "$GIT_AUTHOR_NAME" = "oliv" ]
then
    an="oliv"
    am=""
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     26  omeg -> Rafał Wojdyła <omeg@invisiblethingslab.com>
if [ "$GIT_AUTHOR_NAME" = "omeg" ]
then
    cn="Rafał Wojdyła"
    cm="omeg@invisiblethingslab.com"
fi
if [ "$GIT_AUTHOR_NAME" = "omeg" ]
then
    an="Rafał Wojdyła"
    am="omeg@invisiblethingslab.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     23  wikimaster
if [ "$GIT_AUTHOR_NAME" = "wikimaster" ]
then
    cn="wikimaster"
    cm=""
fi
if [ "$GIT_AUTHOR_NAME" = "wikimaster" ]
then
    an="wikimaster"
    am=""
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     23  woju -> Wojciech Zygmunt Porczyk <woju@invisiblethingslab.com>
if [ "$GIT_AUTHOR_NAME" = "woju" ]
then
    cn="Wojciech Zygmunt Porczyk"
    cm="woju@invisiblethingslab.com"
fi
if [ "$GIT_AUTHOR_NAME" = "woju" ]
then
    an="Wojciech Zygmunt Porczyk"
    am="woju@invisiblethingslab.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     20  franz -> Franz Felix <169101@gmail.com> ?
if [ "$GIT_AUTHOR_NAME" = "franz" ]
then
    cn="Franz Felix"
    cm="169101@gmail.com"
fi
if [ "$GIT_AUTHOR_NAME" = "franz" ]
then
    an="Franz Felix"
    am="169101@gmail.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     11  bowabos -> Alex Dubois <bowabos@gmail.com>
if [ "$GIT_AUTHOR_NAME" = "bowabos" ]
then
    cn="Alex Dubois"
    cm="bowabos@gmail.com"
fi
if [ "$GIT_AUTHOR_NAME" = "bowabos" ]
then
    an="Alex Dubois"
    am="bowabos@gmail.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#     10  abel -> Abel Luck <abel@guardianproject.info>
if [ "$GIT_AUTHOR_NAME" = "abel" ]
then
    cn="Abel Luck"
    cm="abel@guardianproject.info"
fi
if [ "$GIT_AUTHOR_NAME" = "abel" ]
then
    an="Abel Luck"
    am="abel@guardianproject.info"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      8  femton
if [ "$GIT_AUTHOR_NAME" = "femton" ]
then
    cn="femton"
    cm=""
fi
if [ "$GIT_AUTHOR_NAME" = "femton" ]
then
    an="femton"
    am=""
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      7  v
if [ "$GIT_AUTHOR_NAME" = "v" ]
then
    cn="Vincent Penquerc'h"
    cm="vincent@collabora.co.uk"
fi
if [ "$GIT_AUTHOR_NAME" = "v" ]
then
    an="Vincent Penquerc'h"
    am="vincent@collabora.co.uk"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      5  aga
if [ "$GIT_AUTHOR_NAME" = "aga" ]
then
    cn="aga"
    cm=""
fi
if [ "$GIT_AUTHOR_NAME" = "aga" ]
then
    an="aga"
    am=""
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      5  andrewb -> Andrew B <kyboren@riseup.net> ?
if [ "$GIT_AUTHOR_NAME" = "andrewb" ]
then
    cn="Andrew B"
    cm="kyboren@riseup.net"
fi
if [ "$GIT_AUTHOR_NAME" = "andrewb" ]
then
    an="Andrew B"
    am="kyboren@riseup.net"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      4  abb -> Alexandre Bezroutchko <abb@gremwell.com> ?
if [ "$GIT_AUTHOR_NAME" = "abb" ]
then
    cn="Alexandre Bezroutchko"
    cm="abb@gremwell.com"
fi
if [ "$GIT_AUTHOR_NAME" = "abb" ]
then
    an="Alexandre Bezroutchko"
    am="abb@gremwell.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      4  smoku
if [ "$GIT_AUTHOR_NAME" = "smoku" ]
then
    cn="smoku"
    cm=""
fi
if [ "$GIT_AUTHOR_NAME" = "smoku" ]
then
    an="smoku"
    am=""
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      3  andrewx192 -> Andrew Sorensen <andrewx192@gmail.com>
if [ "$GIT_AUTHOR_NAME" = "andrewx192" ]
then
    cn="Andrew Sorensen"
    cm="andrewx192@gmail.com"
fi
if [ "$GIT_AUTHOR_NAME" = "andrewx192" ]
then
    an="Andrew Sorensen"
    am="andrewx192@gmail.com"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      1  (unknown)
if [ "$GIT_AUTHOR_NAME" = "(unknown)" ]
then
    cn="(unknown)"
    cm=""
fi
if [ "$GIT_AUTHOR_NAME" = "(unknown)" ]
then
    an="(unknown)"
    am=""
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"

#      1  gynvael -> Gynvael Coldwind <gynvael@coldwind.pl> ?
if [ "$GIT_AUTHOR_NAME" = "gynvael" ]
then
    cn="Gynvael Coldwind"
    cm="gynvael@coldwind.pl"
fi
if [ "$GIT_AUTHOR_NAME" = "gynvael" ]
then
    an="Gynvael Coldwind"
    am="gynvael@coldwind.pl"
fi
export GIT_AUTHOR_NAME="$an"
export GIT_AUTHOR_EMAIL="$am"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
 ' -- --all

#
#    506  joanna -> Joanna Rutkowska <joanna@invisiblethingslab.com>
#    228  marmarek -> Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
#    148  trac
#    139  axon -> Axon <axon@openmailbox.org>
#    121  Zrubi -> Zrubecz Laszlo <mail@zrubi.hu>
#     99  Nukama -> Hakisho Nukama <nukama@gmail.com>
#     45  rafal -> Rafal Wojtczuk <rafal@invisiblethingslab.com>
#     29  oliv
#     26  omeg -> Rafał Wojdyła <omeg@invisiblethingslab.com>
#     23  wikimaster
#     23  woju -> Wojciech Zygmunt Porczyk <woju@invisiblethingslab.com>
#     20  franz -> Franz Felix <169101@gmail.com> ?
#     11  bowabos -> Alex Dubois <bowabos@gmail.com>
#     10  abel -> Abel Luck <abel@guardianproject.info>
#      8  femton
#      7  v
#      5  aga
#      5  andrewb -> Andrew B <kyboren@riseup.net> ?
#      4  abb -> Alexandre Bezroutchko <abb@gremwell.com> ?
#      4  smoku
#      3  andrewx192 -> Andrew Sorensen <andrewx192@gmail.com>
#      1  (unknown)
#      1  gynvael -> Gynvael Coldwind <gynvael@coldwind.pl> ?
