#!/usr/bin/python3

import debian.deb822
import re
import subprocess

pkgdeps = []
for paragraph in debian.deb822.Deb822.iter_paragraphs(open('debian/control')):
    for item in paragraph.items():
        if item[0] == 'Build-Depends':
            pkgdeps = pkgdeps + [x.strip() for x in item[1].split(',')]
        if item[0] == 'Depends':
            pkgdeps = pkgdeps + [x.strip() for x in item[1].split(',')]
pkgdeps = [x for x in pkgdeps if not (re.match(r'\$.*', x) or x == '')]
pkgdeps = sorted(set([re.sub(r' .*', r'', x) for x in pkgdeps]))

sagedeps = subprocess.run([
    '/bin/sh', '-c',
    'for dt in sage/build/pkgs/*/distros/debian.txt; do cat $dt; done'
],stdout=subprocess.PIPE).stdout.decode().split('\n')
sagedeps = sorted(set(' '.join([re.sub(r'#.*', r'', x) for x in sagedeps]).split()))

onlypkg = [x for x in pkgdeps if not x in sagedeps]
onlysage = [x for x in sagedeps if not x in pkgdeps]

print("Package dependencies that do not appear in debian.txt files:")
print(' '.join(onlypkg))

print("Entries in debian.txt files that do not appear in package dependencies:")
print(' '.join(onlysage))
