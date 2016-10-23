# Todo for getting Sage 7.3 or 7.4 into Debian stretch

## Before 2016-11-05 (transition freeze):
Complete transitions

*   Packages:
    *   brial
    *   gap (2.9)
    *   libfplll (5.0.3)
    *   ipython (5.1.0)

## Before 2017-01-05 (soft freeze, no new packages enter testing):
Upload all packages and make sure they migrate to testing

*   Sage:
    *   (if 7.3) backport #21221 - depends on fpylll
                 or patch it ourselves to use fplll 5

*   Updates:
    *   jmol 14.2.11
    *   libgap 4.8.4 (also switch to using gap 4.8.4, trac ticket 20914)

*   Updates that may not be needed:
    *   configparser 3.5 (only sage-7.4)
    *   cvxopt 1.1.8
    *   ecl 16.1.2
    *   ppl 1.2
    *   pytz 2016.4

*   New packages:
    *   ipywidgets (and dependencies)
    *   jupyter-notebook
    *   sagenb
    *   sagenb_export
    *   widgetsnbextension
    *   fpylll (only sage-7.4, or if sage-7.3 and backporting #21221)
    *   thebe (only sage-7.4)

*   Packages currently in experimental:
    *   ipykernel
    *   jupyter_client
    *   jupyter_core
    *   nbconvert
    *   nbformat

*   Required patches:
    *   numpy (patch)

*   Ugly packages:
    *   maxima-sage
    *   if pari 2.9 makes it to stretch, backport sage's (not yet existing) changes for pari 2.9
        or upload pari-sage (2.8), cysignals-pari-sage, eclib-pari-sage and lcalc-pari-sage
    *   patch sage to work with planarity 3.0
        (preliminary patch already exists, see debian/patches/version-planarity-3.patch
         it compiles but breaks tests)
        or upload planarity 2.2

*   Packages that have issues preventing testing migration:
    * cython 0.24.1
    * ecl 15.3.7+dfsg1-2 (because of libatomic-ops)
    * fflas-ffpack 1.6.0
    * linbox 1.4.2

*   And finally:
    *   sagemath
    *   sagetex
