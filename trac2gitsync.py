#!/usr/bin/python -O
# Author: Wojtek Porczyk <woju@invisiblethingslab.com>
# Contributor: Hakisho Nukama <nukama@gmail.com>

from __future__ import print_function

import errno
import fcntl
import os
import subprocess
import sys
import time

import sqlite3
import trac.env
import trac.test
import trac.util.datefmt
import trac.web.chrome
import trac.web.href
import trac.wiki
import trac.wiki.formatter

ENVIRONMENT = '.'
WIKIPATH = '/home/user/src/wiki'

env = trac.env.Environment(ENVIRONMENT)

def trac2html(name, text):
    req = trac.test.Mock(
        href=trac.web.href.Href('/'),
        abs_href=trac.web.href.Href('http://www.example.com/'),
        chrome={},
        session={},
        authname='wikiexporter',
        perm=trac.test.MockPerm(),
        tz=trac.util.datefmt.utc,
        args={},
        locale=trac.test.locale_en,
        lc_time=trac.test.locale_en)

    context = trac.web.chrome.web_context(req, 'wiki', name)

    return trac.wiki.formatter.format_to_html(env, context, text).encode('utf-8')

def pandoc(fmt, text):
    process = subprocess.Popen(('pandoc', '-f', 'html', '-t', fmt),
        stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    stdout, stderr = process.communicate(text)
    return stdout.decode('utf-8')

class GitSync(object):
    gitsyncdir = '/home/user/trac2gitsync'
    lockfile = '/home/user/trac2gitsync.lock'

    def logdebug(self, s):
        print(s)

    def git(self, *args):
        process = subprocess.Popen(('git',) + args, stderr=subprocess.PIPE, cwd=self.gitsyncdir)
        _, stderr = process.communicate()
        retcode = process.poll()
        if retcode:
            self.logdebug('git{0!r} -> retcode={1!r} {2!r}'.format(args, retcode, stderr))
        else:
            self.logdebug('git{0!r}'.format(args))

    def git_rm(self, name, ext):
        filename = self.get_filename(name, ext)
        os.unlink(filename)
        dirname = os.path.dirname(filename)
        if dirname.rstrip('/') != self.gitsyncdir.rstrip('/'):
            os.removedirs(dirname)
        self.git('rm', filename)

    def git_add(self, name, text, extension):
        filename = self.get_filename(name, extension)
        try: os.makedirs(os.path.dirname(filename))
        except OSError, e:
            if e.errno != errno.EEXIST: raise
        open(filename, 'wb').write(text.encode('utf-8'))
        self.git('add', filename)

    def git_checkmailmap(self, author, mailmap='mailmap.file=/home/user/src/wiki/.mailmap'):
        process = subprocess.Popen(('git', '-c', mailmap, 'check-mailmap', author, 'HEAD'), stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        stdout, stderr = process.communicate(author)
        return stdout.decode('utf-8')

    def git_commit(self, name, tag, comment=None, author=None, date=None):
        message = u'{0} {1}\n'.format(name, tag)
        if comment is not None:
            message += u'\n{0}\n'.format(comment)

        if author is None:
            author = u'(unknown)'

        if date:
            self.git('commit', '--author={0} <>'.format(author.encode('utf-8')), '-m', message.encode('utf-8'), '--date', date)
        else:
            self.git('commit', '--author={0} <>'.format(author.encode('utf-8')), '-m', message.encode('utf-8'))

    def git_reset(self):
        self.git('reset', '--hard', 'HEAD')

    def get_filename(self, name, ext):
        filename = os.path.join(self.gitsyncdir, name.encode('utf-8')) + ext
        assert not filename.startswith('../')
#       assert not filename.endswith('/..')
        assert '/../' not in filename
        return filename

    def lock(self):
        self.logdebug('lock()')
        if hasattr(self, 'lockfd'): return
        self.lockfd = open(self.lockfile, 'a')
        fcntl.flock(self.lockfd, fcntl.LOCK_EX)

    def unlock(self):
        self.logdebug('unlock()')
        if not hasattr(self, 'lockfd'): return
        fcntl.flock(self.lockfd, fcntl.LOCK_UN)
        self.lockfd.close()
        del self.lockfd

def main():
    gitsync = GitSync()
    os.mkdir(gitsync.gitsyncdir)
    gitsync.git('init')
    conn = sqlite3.connect('/home/user/src/wiki/db/trac.db')
    cursor = conn.cursor()
    cursor.execute('SELECT name, version, time, author, text, comment FROM wiki WHERE author != "trac" ORDER BY time, version;')

    for row in cursor:
        print(row[0], row[1], row[3])
        html = trac2html(row[0], row[4])
#        gitsync.git_add(row[0], html, '.html')
        md = pandoc('markdown_github', html)
        gitsync.git_add(row[0], md, '.md')
#        rst = pandoc('rst', html)
#        gitsync.git_add(row[0], rst, '.rest')
#        author = gitsync.git_checkmailmap(row[3] + '<>')
#        print (author)
#       print(self.git_checkmailmap({0} + '<>'))
        gitsync.git_commit(row[0], 'changed', comment=row[5], author=row[3], date=time.strftime('%Y-%m-%dT%H:%M:%S+0000', time.gmtime(int(row[2]) / 1000000)))

if __name__ == '__main__':
    main()


# vim: ts=4 sw=4 et
