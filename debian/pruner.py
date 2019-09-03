#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os
import codecs
import subprocess
import sys
import time
from optparse import OptionParser

now = int(time.time())
installed_dir = ''

def mkdir_if_needed(dirname):
    if not os.path.exists(dirname):
        os.makedirs(dirname)

def declare_system(package):
    version = subprocess.check_output(['/bin/cat', '%s/build/pkgs/%s/package-version.txt' % (sr, package)]).decode().strip()
    filename = '{0:s}/{1:s}-{2:s}'.format(installed_dir, package, version)
    installed = codecs.open(filename, 'w')
    installed.write ('system')
    installed.close()
    # This is ABSOLUTELY NECESSARY: otherwise sage's Makefiles will think that
    # pkgs whose "package-version.txt" files that we touched later (simply
    # because we listed them later in "dico" below), obsolete their
    # reverse-dependencies further back in the list, and sage will try to
    # download and build these destroying all our hard work here.
    #
    # The "cleaner" way to fix this is to re-order dico below to be in reverse
    # topological order wrt the dependency graph, but I couldn't be bothered
    # figuring out what that is.
    os.utime(filename, (now, now))

if __name__ == '__main__':
    parser = OptionParser()
    parser.add_option('--sageroot', dest='sageroot', metavar='SAGEROOT', default='-')
    options, args = parser.parse_args()

    if options.sageroot == '-':
        print >> sys.stdout, 'ERROR: Script called without specifying --sageroot option.'
        sys.exit(system_packages_not_found)
    else:
        sr = options.sageroot

    installed_dir = '%s/local/var/lib/sage/installed' % sr

    mkdir_if_needed (installed_dir)
    mkdir_if_needed ('%s/local' % sr)
    mkdir_if_needed ('%s/local/include' % sr)
    # if this file is newer than an spkg's "installed" marker file then sage's
    # Makefiles will try to rebuild it again, so touch it as well.
    dummy_pkg = os.path.join(installed_dir, ".dummy")
    with open(dummy_pkg, 'a'):
        os.utime(dummy_pkg, (now, now))

    sage_standard_packages = set(subprocess.check_output([
        '/bin/sh', '-c',
        'for p in %s/build/pkgs/*; do test $(cat $p/type) = standard && basename $p; done' % sr
    ]).split())

    sage_standard_packages.add('python2')

    for key in sage_standard_packages:
        declare_system(key)
