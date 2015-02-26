#!/bin/sh
git filter-branch -f -d /dev/shm/git --env-filter '
an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"

case ${GIT_AUTHOR_NAME} in
    joanna)    cn="Joanna Rutkowska"    ;    cm="joanna@invisiblethingslab.com"    ;;
    marmarek)    cn="Marek Marczykowski-Górecki"    ;    cm="marmarek@invisiblethingslab.com"    ;;
    trac)    cn="trac"    ;    cm=""    ;;
    axon)    cn="Axon"    ;    cm="axon@openmailbox.org"    ;;
    Zrubi)    cn="Zrubecz Laszlo"    ;    cm="mail@zrubi.hu"    ;;
    Nukama)    cn="Hakisho Nukama"    ;    cm="nukama@gmail.com"    ;;
    rafal)    cn="Rafal Wojtczuk"    ;    cm="rafal@invisiblethingslab.com"    ;;
    oliv)    cn="Olivier Medoc"    ;    cm="o_medoc@yahoo.fr"    ;;
    omeg)    cn="Rafał Wojdyła"    ;    cm="omeg@invisiblethingslab.com"    ;;
    wikimaster)    cn="Joanna Rutkowska"    ;    cm="joanna@invisiblethingslab.com"    ;;
    woju)    cn="Wojciech Zygmunt Porczyk"    ;    cm="woju@invisiblethingslab.com"    ;;
    franz)    cn="Franz"    ;    cm="169101@gmail.com"    ;;
    bowabos)    cn="Alex Dubois"    ;    cm="bowabos@gmail.com"    ;;
    abel)    cn="Abel Luck"    ;    cm="abel@guardianproject.info"    ;;
    femton)    cn="IX4 SVS"    ;    cm="ix4svs@gmail.com"    ;;
    v)    cn="Vincent Penquerc%27h"    ;    cm="vincent@collabora.co.uk"    ;;
    aga)    cn="Agnieszka Kostrzewa"    ;    cm="a.kostrzewa@alx.pl"    ;;
    andrewb)    cn="Andrew B"    ;    cm="kyboren@riseup.net"    ;;
    abb)    cn="Alexandre Bezroutchko"    ;    cm="abb@gremwell.com"    ;;
    smoku)    cn="Tomasz Sterna"    ;    cm="tomek@xiaoka.com"    ;;
    andrewx192)    cn="Andrew Sorensen"    ;    cm="andrewx192@gmail.com"    ;;
    gynvael)    cn="Gynvael Coldwind"    ;    cm="gynvael@coldwind.pl"    ;;
    *)    cn="(unknown)"    ;    cm=""    ;;
esac

export GIT_AUTHOR_NAME="$cn"
export GIT_AUTHOR_EMAIL="$cm"
export GIT_COMMITTER_NAME="$cn"
export GIT_COMMITTER_EMAIL="$cm"
 ' -- --all
