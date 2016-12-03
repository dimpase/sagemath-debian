# Todo for getting Sage 7.4 into Debian stretch

## Before 2016-12-05 (to make the soft-freeze deadline of 2017-01-05):
Upload packages to NEW, ASAP

*   New packages:
    *   ipywidgets (including jupyter-js-widgets, widgetsnbextension)
        * only a few things left, see d/TODO in https://anonscm.debian.org/git/python-modules/packages/ipywidgets.git
    *   sagenb
        * lots of JS deps, will have to bundle quite a lot and hope ftp-masters are cool
        * Fix "Error typesetting mathematics" with every output, seems to be mathjax related.
        * needs debian/copyright
    *   sagemath
        * ignore known failing doctests
        * figure out Depends: of sagemath package
        * We have plenty lintian warnings about files in /usr/bin
          (binary-without-manpage, script-with-language-extension, executable-not-elf-or-script)
          Maybe we should install most of that to /usr/share/sage/bin.
        * We could create a package containing the (patched) sage sources to make
          it easier to run the testsuite.
        * test with missing jmol (maybe set canvas3d as default in
          src/sage/plot/plot3d/base.pyx / src/sage/graphs/generic_graph.py ?)
          * might be possible to package jmol and disable only jsmol, if that's easier
            see https://github.com/infinity0/jmol/ and its Makefile
            we would remove JSmol, then graft the rest onto the existing debian jmol packaging
    *   sagetex (already in experimental, does not need to pass NEW)

*   Packages that have issues preventing testing migration:
    *   pyzmq
    *   zeromq3

## Before 2017-01-25 (to make the hard-freeze deadline of 2017-02-05):
Upload all packages and make sure they migrate to testing after 10 days

*   Require patches:
    *   numpy (only test fixes)
    *   sympy (only test fixes)
        -- see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=840621
        -- and https://lists.alioth.debian.org/pipermail/debian-science-sagemath/Week-of-Mon-20161010/000254.html
    *   gap
        -- see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=844789

*   Try to fix some FTBFS:
    *   fflas-ffpack (no package on armel, mips, s390x)

## Later

*   Updates that may not be needed:
    *   configparser 3.5
    *   cvxopt 1.1.8

*   New packages
    *   thebe
        * not *too* essential - SPKG.txt says
          "used by Sage's Sphinx-based documentation build system to produce
           html documentation that can be turned live"
        * lots of JS deps, need to evaluate

*   Ugly packages:
    *   jmol and jsmol (14.6.1)
        probably just disable it for stretch
        "almost" done here:
          https://github.com/infinity0/jmol/
          https://github.com/infinity0/java2script/
        background:
          https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=719330
        blocked on:
          https://sourceforge.net/p/jmol/bugs/587/?page=1
          https://sourceforge.net/p/jmol/bugs/589/
          https://github.com/zhourenjian/java2script/issues/8
