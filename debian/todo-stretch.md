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
    *   jupyter-notebook
    *   sagenb
        * lots of JS deps, need to evaluate ASAP
    *   sagenb_export
        * Done in git, waiting on jupyter-notebook
    *   thebe
        * lots of JS deps, need to evaluate ASAP
        * not *too* essential - SPKG.txt says
          "used by Sage's Sphinx-based documentation build system to produce
           html documentation that can be turned live"

## Before 2017-01-05 (soft freeze, no new packages enter testing):
Upload all packages and make sure they migrate to testing

*   Updates:
    *   libgap 4.8.4 (also switch to using gap 4.8.4, trac ticket 20914)

*   Packages that have issues preventing testing migration:
    * cython 0.24.1
    * ecl 15.3.7+dfsg1-2 (because of libatomic-ops)
    * fflas-ffpack 1.6.0
    * linbox 1.4.2

*   Require patches:
    *   cython
    *   numpy (only test fixes)
    *   sympy (only test fixes)
        -- see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=840621
        -- and https://lists.alioth.debian.org/pipermail/debian-science-sagemath/Week-of-Mon-20161010/000254.html

*   Ugly packages:
    *   maxima-sage
    *   patch sage to work with planarity 3.0
        (preliminary patch already exists, see debian/patches/version-planarity-3.patch
         it compiles but breaks tests)
        or upload planarity 2.2
    *   jmol (14.6.1)

*   Updates that may not be needed:
    *   configparser 3.5
    *   cvxopt 1.1.8
    *   ecl 16.1.2
    *   ppl 1.2
    *   pytz 2016.4

*   And finally:
    *   sagemath
    *   sagetex
