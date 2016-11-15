# Todo for getting Sage 7.4 into Debian stretch

## Before 2016-12-05 (to make the soft-freeze deadline of 2017-01-05):
Upload packages to NEW, ASAP

*   New packages:
    *   ipywidgets (including jupyter-js-widgets, widgetsnbextension)
        plus dependencies:
        * d3-format
        * scriptjs
        * html2canvas
        * webpack, or use node-source-map directly without webpack
        * + devDependencies, might be nasty. should evaluate ASAP
    *   sagenb
        * lots of JS deps, need to evaluate ASAP
    *   sagenb_export
        * Done in git; needs testing with jupyter-notebook, then can upload
    *   maxima-sage
        https://anonscm.debian.org/cgit/debian-science/packages/maxima-sage.git/
        https://trac.sagemath.org/ticket/18920
        https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=779804
        needs ecl > 16.1.2 (unreleased)
    *   sagemath
        * apply planarity patch, ignore failing doctests
          debian/patches/version-planarity-3.patch
        * ignore other known failing doctests
        * test with missing jmol (maybe set canvas3d as default in
          src/sage/plot/plot3d/base.pyx / src/sage/graphs/generic_graph.py ?)
        * disable thebe

*   Packages that have issues preventing testing migration:
    *   cython 0.24.1
    *   ecl 15.3.7+dfsg1-2 (because of libatomic-ops)
    *   fflas-ffpack 1.6.0
    *   linbox 1.4.2

## Before 2017-01-25 (to make the hard-freeze deadline of 2017-02-05):
Upload all packages and make sure they migrate to testing after 10 days

*   Require patches:
    *   cython
    *   numpy (only test fixes)
    *   sympy (only test fixes)
        -- see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=840621
        -- and https://lists.alioth.debian.org/pipermail/debian-science-sagemath/Week-of-Mon-20161010/000254.html

*   Sage updates:
    *   Fix ~40 doctests related to gap/libgap 4.8.5
        https://trac.sagemath.org/ticket/20914
    *   Fix XXX doctests related to planarity 3.0
        https://trac.sagemath.org/ticket/21774
        or disable it, if this is too hard

*   Other updates:
    *   sagetex

## Later

*   Updates that may not be needed:
    *   configparser 3.5
    *   cvxopt 1.1.8
    *   pytz 2016.4

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
