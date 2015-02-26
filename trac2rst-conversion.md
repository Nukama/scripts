'''
git clone git://gitorious.org/qubes-os/wiki ~/repositories/gitorious.org/qubes-os/wiki
cd ~/repositories/gitorious.org/qubes-os/wiki
git shortlog -s -n
'''

Create a mapping between each trac user "example" and "Example Name <name@example.com>" 
for git check-mailmap or this case statement:
'''
case ${GIT_AUTHOR_NAME} in
    example)    cn="Example Name"    ;    cm="example@example.com"    ;;
    *)    cn="(unknown)"    ;    cm=""    ;;
esac
'''

And insert it into git-filter-branch-git-author-committer-name-email-case.sh.

Then convert repository to desired format (specified in trac2rst.sh)
'''
~/repositories/github.com/Nukama/scripts/git-filter-branch-rm-files.sh
~/repositories/github.com/Nukama/scripts/git-filter-branch-trac2rst.sh
~/repositories/github.com/Nukama/scripts/git-filter-branch-git-author-committer-name-email-case.sh
git remote set-url origin git@github.com:USERNAME/USERNAME.github.io.wiki.git
git push -f
'''