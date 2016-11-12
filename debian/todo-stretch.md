# Todo for getting Sage 7.4 into Debian stretch

## Before 2016-12-05 (soft deadline for us, to make the soft-freeze):
Upload packages to NEW

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
        * Done in git, waiting on jupyter-notebook
    *   thebe
        * not *too* essential - SPKG.txt says
          "used by Sage's Sphinx-based documentation build system to produce
           html documentation that can be turned live"
        * lots of JS deps, need to evaluate

## Before 2017-01-05 (soft freeze, no new packages enter testing):
Upload all packages and make sure they migrate to testing

*   Packages that have issues preventing testing migration:
    *   cython 0.24.1
    *   ecl 15.3.7+dfsg1-2 (because of libatomic-ops)
    *   fflas-ffpack 1.6.0
    *   linbox 1.4.2

*   Require patches:
    *   cython
    *   numpy (only test fixes)
    *   sympy (only test fixes)
        -- see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=840621
        -- and https://lists.alioth.debian.org/pipermail/debian-science-sagemath/Week-of-Mon-20161010/000254.html

*   Ugly packages:
    *   maxima-sage
        https://anonscm.debian.org/cgit/debian-science/packages/maxima-sage.git/
        https://trac.sagemath.org/ticket/18920
        https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=779804
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

*   Sage updates:
    *   gap/libgap 4.8.5 https://trac.sagemath.org/ticket/20914
        ~40 tests currently broken due to this
    *   planarity 3.0 https://trac.sagemath.org/ticket/21774
        (preliminary patch already exists, see debian/patches/version-planarity-3.patch
         it compiles but breaks tests)
        or upload planarity 2.2
        or disable it for stretch

*   Updates that may not be needed:
    *   configparser 3.5
    *   cvxopt 1.1.8
    *   ecl 16.1.2
    *   ppl 1.2
    *   pytz 2016.4

*   And finally:
    *   sagemath
    *   sagetex
