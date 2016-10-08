# Todo for getting Sage 7.3 or 7.4 into Debian stretch

## Before 2016-11-05 (transition freeze):
Complete transitions

*   Packages:
    *   brial
    *   libfplll (5.0.2 or 5.0.3)
        and (for sage-7.3) backport trac ticket 21221
    *   ipython (5.1.0)
        and (for sage-7.3) backport trac ticket 21006 (?)

## Before 2017-01-05 (soft freeze, no new packages enter testing):
Upload all packages and make sure they migrate to testing

*   Updates:
    *   linbox 1.4.2
    *   jmol 14.2.11
    *   libgap 4.8.4 (also switch to using gap 4.8.4, trac ticket 20914)

*   Updates that may not be needed:
    *   configparser 3.5 (only sage-7.4)
    *   cvxopt 1.1.8
    *   ppl 1.2
    *   pytz 2016.4

*   New packages:
    *   ipywidgets (and dependencies)
    *   jupyter-notebook
    *   sagenb
    *   sagenb_export
    *   widgetsnbextension
    *   thebe (only sage-7.4)

*   Packages currently in experimental:
    *   ipykernel
    *   jupyter_client
    *   jupyter_core
    *   nbconvert
    *   nbformat
    *   sagetex

*   Required patches:
    *   ecl (patch)
    *   numpy (patch)

*   Ugly packages:
    *   maxima-sage
    *   backport trac ticket 17254 and use singular 4
        or upload singular 3
    *   if pari 2.9 makes it to stretch, backport sage's (not yet existing) changes for pari 2.9
        or upload pari-sage (2.8), eclib-pari-sage and lcalc-pari-sage
    *   patch sage to work with planarity 3.0
        or upload planarity 2.2

*   And finally:
    *   sagemath
