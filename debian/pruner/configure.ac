AC_INIT()

m4_include([/usr/share/aclocal/pkg.m4])
m4_include([m4/python_module.m4])

AC_ARG_WITH([sage-root],
            [  --with-sage-root=<path> path to where sage is unpacked],
	    [SAGE_ROOT="$withval"],
	    [SAGE_ROOT="/home/jpuydt/sage-exp"])
AC_SUBST(SAGE_ROOT)

PKG_PROG_PKG_CONFIG

AC_CHECK_HEADER(atlas/clapack.h, HAS_ATLAS="True", HAS_ATLAS="False")
AC_SUBST(HAS_ATLAS)

# FIXME(backports_ssl_match_hostname): only needed for tornado, hence not needed
HAS_BACKPORTS_SSL_MATCH_HOSTNAME="True"
AC_SUBST(HAS_BACKPORTS_SSL_MATCH_HOSTNAME)

AC_CHECK_HEADER(gc.h, HAS_BOEHM_GC="True", HAS_BOEHM_GC="False")
AC_SUBST(HAS_BOEHM_GC)

AC_CHECK_HEADER(boost/regex.h, HAS_BOOST="True", HAS_BOOST="False")
AC_SUBST(HAS_BOOST)

AC_CHECK_PROG(HAS_BZIP2, bzip2, "True", "False")
AC_SUBST(HAS_BZIP2)

AC_CHECK_PROG(HAS_CDDLIB, cdd_both_reps, "True", "False")
AC_CHECK_HEADER(cdd/setoper.h, HAS_CDDLIB="True", HAS_CDDLIB="False")
AC_SUBST(HAS_CDDLIB)

# FIXME(cephes): we shouldn't need it
HAS_CEPHES="True"
AC_SUBST(HAS_CEPHES)

# FIXME(certifi): only needed for tornado, hence not needed
HAS_CERTIFI="True"
AC_SUBST(HAS_CERTIFI)

AC_CHECK_HEADER(cliquer/cliquer.h, HAS_CLIQUER="True", HAS_CLIQUER="False")
AC_SUBST(HAS_CLIQUER)

AC_CHECK_FILE(/usr/share/sagemath/combinatorial_designs/MOLS_table.txt, HAS_COMBINATORIAL_DESIGNS="True", HAS_COMBINATORIAL_DESIGNS="False")
AC_SUBST(HAS_COMBINATORIAL_DESIGNS)

AC_CHECK_FILE(/usr/share/sagemath/conway_polynomials/conway_polynomials.sobj, HAS_CONWAY_POLYNOMIALS="True", HAS_CONWAY_POLYNOMIALS="False")
AC_SUBST(HAS_CONWAY_POLYNOMIALS)

AC_CHECK_PYTHON_MODULE(cvxopt)
if test "x${PYTHON_cvxopt}" = "x1"; then
  HAS_CVXOPT="True"
else
  HAS_CVXOPT="False"
fi
AC_SUBST(HAS_CVXOPT)

AC_CHECK_PROG(HAS_CYTHON, cython, "True", "False")
AC_SUBST(HAS_CYTHON)

AC_CHECK_PYTHON_MODULE(dateutil)
if test "x${PYTHON_dateutil}" = "x1"; then
  HAS_DATEUTIL="True"
else
  HAS_DATEUTIL="False"
fi
AC_SUBST(HAS_DATEUTIL)

AC_CHECK_PYTHON_MODULE(docutils)
if test "x${PYTHON_docutils}" = "x1"; then
  HAS_DOCUTILS="True"
else
  HAS_DOCUTILS="False"
fi
AC_SUBST(HAS_DOCUTILS)

AC_CHECK_PROG(HAS_ECL, ecl, "True", "False")
AC_SUBST(HAS_ECL)

AC_LANG_PUSH([C++])
old_CPPFLAGS=$CPPFLAGS
CPPFLAGS="${old_CPPFLAGS} -DNTL_ALL"
AC_CHECK_HEADER(eclib/curve.h, eclib_header=1, eclib_header=0)
CPPFLAGS=$old_CPPFLAGS
AC_LANG_POP([C++])
AC_CHECK_PROG(eclib_tools, mwrank, 1, 0)
if test "${eclib_header}${eclib_tools}" = "11"; then
  HAS_ECLIB="True"
else
  HAS_ECLIB="False"
fi
AC_SUBST(HAS_ECLIB)

AC_CHECK_PROG(HAS_ECM, ecm, "True", "False") # package gmp-ecm!
AC_CHECK_HEADER(ecm.h, , HAS_ECM="False")
AC_SUBST(HAS_ECM)

AC_CHECK_FILE(/usr/share/sagemath/cremona/cremona_mini.db, HAS_ELLIPTIC_CURVES="True", HAS_ELLIPTIC_CURVES="False")
AC_SUBST(HAS_ELLIPTIC_CURVES)

AC_CHECK_PROG(HAS_FFLAS_FFPACK, fflas-ffpack-config, "True", "False")
AC_SUBST(HAS_FFLAS_FFPACK)

AC_CHECK_HEADER(flint/config.h, HAS_FLINT="True", HAS_FLINT="False")
AC_SUBST(HAS_FLINT)

AC_CHECK_PROG(HAS_FLINTQS, QuadraticSieve, "True", "False")
AC_SUBST(HAS_FLINTQS)

AC_LANG_PUSH([C++])
AC_CHECK_HEADER(fplll/fplll.h, HAS_FPLLL="True", HAS_FPLLL="False")
AC_LANG_POP([C++])
AC_SUBST(HAS_FPLLL)

AC_CHECK_PROG(HAS_FREETYPE, freetype-config, "True", "False")
AC_SUBST(HAS_FREETYPE)

AC_CHECK_FILE(/usr/include/gap/gap.h, HAS_GAP="True", HAS_GAP="False")
AC_SUBST(HAS_GAP)

AC_CHECK_HEADER(gd.h, HAS_GD="True", HAS_GD="False")
AC_SUBST(HAS_GD)

AC_CHECK_HEADER(gf2x.h, HAS_GF2X="True", HAS_GF2X="False")
AC_SUBST(HAS_GF2X)

AC_CHECK_PROG(HAS_GFAN, gfan, "True", "False")
AC_SUBST(HAS_GFAN)

AC_CHECK_PROG(HAS_GFORTRAN, gfortran, "True", "False")
AC_SUBST(HAS_GFORTRAN)

AC_CHECK_PROG(HAS_GIT, git, "True", "False")
AC_SUBST(HAS_GIT)

AC_CHECK_HEADER(givaro-config.h, HAS_GIVARO="True", HAS_GIVARO="False")
AC_SUBST(HAS_GIVARO)

AC_CHECK_HEADER(glpk.h, HAS_GLPK="True", HAS_GLPK="False")
AC_SUBST(HAS_GLPK)

AC_CHECK_FILE(/usr/share/sagemath/graphs/graphs.db, HAS_GRAPHS="True", HAS_GRAPHS="False")
AC_SUBST(HAS_GRAPHS)

AC_CHECK_PROG(HAS_GSL, gsl-config, "True", "False")
AC_SUBST(HAS_GSL)

# FIXME(iconv): unneeded on glibc platforms as far as I know
HAS_ICONV="True"
AC_SUBST(HAS_ICONV)

AC_CHECK_HEADER(iml.h, HAS_IML="True", HAS_IML="False", [#include "gmp.h"])
AC_SUBST(HAS_IML)

AC_CHECK_PROG(HAS_IPYTHON, ipython, "True", "False")
AC_SUBST(HAS_IPYTHON)

AC_CHECK_PYTHON_MODULE(jinja2)
if test "x${PYTHON_jinja2}" = "x1"; then
  HAS_JINJA2="True"
else
  HAS_JINJA2="False"
fi
AC_SUBST(HAS_JINJA2)

# FIXME(jmol): debian's version is too old, use sage's
HAS_JMOL="False"
AC_SUBST(HAS_JMOL)

AC_CHECK_PYTHON_MODULE(jsonschema)
if test "x${PYTHON_jsonschema}" = "x1"; then
  HAS_JSONSCHEMA="True"
else
  HAS_JSONSCHEMA="False"
fi
AC_SUBST(HAS_JSONSCHEMA)

AC_LANG_PUSH([C++])
AC_CHECK_HEADER(Lfunction/L.h, HAS_LCALC="True", HAS_LCALC="False")
AC_LANG_POP([C++])
AC_SUBST(HAS_LCALC)

# FIXME(libgap): shouldn't exist, but does: use sage's
HAS_LIBGAP="False"
AC_SUBST(HAS_LIBGAP)

AC_CHECK_PROG(HAS_LIBPNG, libpng-config, "True", "False")
AC_SUBST(HAS_LIBPNG)

AC_CHECK_PROG(HAS_LINBOX_CONFIG, linbox-config, "1", "0")
AC_LANG_PUSH([C++])
AC_CHECK_HEADER(linbox/linbox-sage.h, HAS_LINBOX_SAGE="1", HAS_LINBOX_SAGE="0", [#include "gmp.h"])
AC_LANG_POP([C++])
if test "x${HAS_LINBOX_SAGE}${HAS_LINBOX_CONFIG}" = "x11"; then
  HAS_LINBOX="True"
else
  HAS_LINBOX="False"
fi

AC_SUBST(HAS_LINBOX)

AC_CHECK_HEADER(lrcalc/list.h, HAS_LRCALC="True", HAS_LRCALC="False")
AC_SUBST(HAS_LRCALC)

AC_LANG_PUSH([C++])
AC_CHECK_HEADERS(m4ri/m4ri.h, HAS_M4RI="True", HAS_M4RI="False")
AC_LANG_POP([C++])
AC_SUBST(HAS_M4RI)

AC_LANG_PUSH([C++])
AC_CHECK_HEADERS(m4rie/m4rie.h, HAS_M4RIE="True", HAS_M4RIE="False")
AC_LANG_POP([C++])
AC_SUBST(HAS_M4RIE)

# FIXME(markupsafe): only needed for jinja2, hence not needed
HAS_MARKUPSAFE="True"
AC_SUBST(HAS_MARKUPSAFE)

AC_CHECK_FILE(/usr/share/javascript/mathjax/MathJax.js, HAS_MATHJAX="True", HAS_MATHJAX="False")
AC_SUBST(HAS_MATHJAX)

AC_CHECK_PYTHON_MODULE(matplotlib)
if test "x${PYTHON_matplotlib}" = "x1"; then
  HAS_MATPLOTLIB="True"
else
  HAS_MATPLOTLIB="False"
fi
AC_SUBST(HAS_MATPLOTLIB)

# FIXME(maxima): needs quite special instructions to get it going
HAS_MAXIMA="True"
AC_CHECK_FILE(/usr/share/doc/maxima-share/copyright, , HAS_MAXIMA="False")
AC_CHECK_FILE(/usr/share/doc/maxima-doc/copyright, , HAS_MAXIMA="False")
AC_CHECK_FILE(/usr/share/doc/maxima/copyright, , HAS_MAXIMA="False")
AC_SUBST(HAS_MAXIMA)

AC_CHECK_PYTHON_MODULE(mistune)
if test "x${PYTHON_mistune}" = "x1"; then
  HAS_MISTUNE="True"
else
  HAS_MISTUNE="False"
fi
AC_SUBST(HAS_MISTUNE)

AC_CHECK_HEADERS(mpc.h, HAS_MPC="True", HAS_MPC="False")
AC_SUBST(HAS_MPC)

AC_CHECK_HEADERS(mpfi.h, HAS_MPFI="True", HAS_MPFI="False")
AC_SUBST(HAS_MPFI)

AC_CHECK_HEADERS(mpfr.h, HAS_MPFR="True", HAS_MPFR="False")
AC_SUBST(HAS_MPFR)

# FIXME(mpir): debian wants to avoid using it, not needed as far as I can tell
HAS_MPIR="True"
AC_SUBST(HAS_MPIR)

AC_CHECK_PYTHON_MODULE(mpmath)
if test "x${PYTHON_mpmath}" = "x1"; then
  HAS_MPMATH="True"
else
  HAS_MPMATH="False"
fi
AC_SUBST(HAS_MPMATH)

AC_CHECK_HEADERS(ncurses.h, HAS_NCURSES="True", HAS_NCURSES="False")
AC_SUBST(HAS_NCURSES)

AC_CHECK_PYTHON_MODULE(networkx)
if test "x${PYTHON_networkx}" = "x1"; then
  HAS_NETWORKX="True"
else
  HAS_NETWORKX="False"
fi
AC_SUBST(HAS_NETWORKX)

AC_CHECK_HEADERS(NTL/version.h, HAS_NTL="True", HAS_NTL="False")
AC_SUBST(HAS_NTL)

AC_CHECK_PYTHON_MODULE(numpy)
if test "x${PYTHON_numpy}" = "x1"; then
  HAS_NUMPY="True"
else
  HAS_NUMPY="False"
fi
AC_SUBST(HAS_NUMPY)

AC_CHECK_PROG(HAS_PALP, nef-5d.x, "True", "False")
AC_SUBST(HAS_PALP)

AC_CHECK_HEADER(pari/pari.h, HAS_PARI="True", HAS_PARI="False")
AC_SUBST(HAS_PARI)

AC_CHECK_FILE(/usr/share/pari/galdata/COS10_39_29, HAS_PARI_GALDATA="True", HAS_PARI_GALDATA="False")
AC_SUBST(HAS_PARI_GALDATA)

AC_CHECK_FILE(/usr/share/pari/seadata/sea313, HAS_PARI_SEADATA="True", HAS_PARI_SEADATA="False")
AC_SUBST(HAS_PARI_SEADATA)

AC_CHECK_PROG(HAS_PATCH, patch, "True", "False")
AC_SUBST(HAS_PATCH)

AC_CHECK_PYTHON_MODULE(pexpect)
if test "x${PYTHON_pexpect}" = "x1"; then
  HAS_PEXPECT="True"
else
  HAS_PEXPECT="False"
fi
AC_SUBST(HAS_PEXPECT)

AC_CHECK_PYTHON_MODULE(PIL)
if test "x${PYTHON_PIL}" = "x1"; then
  HAS_PIL="True"
else
  HAS_PIL="False"
fi
AC_SUBST(HAS_PIL)

AC_CHECK_PROG(HAS_PIP, pip, "True", "False")
AC_SUBST(HAS_PIP)

# FIXME(pkgconf): probably not needed, since we have pkg-config
HAS_PKGCONF="True"
AC_SUBST(HAS_PKGCONF)

# FIXME(pkgconfig): probably not needed, since it's not used!
HAS_PKGCONFIG="True"
AC_SUBST(HAS_PKGCONFIG)

# FIXME(planarity): sagemath uses a heavily patched upstream -- work pending
HAS_PLANARITY="False"
AC_SUBST(HAS_PLANARITY)

PKG_CHECK_MODULES(polybori, [polybori-0.8 polybori-groebner-0.8], [HAS_POLYBORI="True"], [HAS_POLYBORI="False"])
AC_SUBST(HAS_POLYBORI)

AC_CHECK_FILE(/usr/share/sagemath/reflexive_polytopes/reflexive_polytopes_2d, HAS_POLYTOPES="True", HAS_POLYTOPES="False")
AC_SUBST(HAS_POLYTOPES)

AC_CHECK_HEADERS(ppl_c.h, HAS_PPL="True", HAS_PPL="False")
AC_SUBST(HAS_PPL)

AC_CHECK_PYTHON_MODULE(Crypto)
if test "x${PYTHON_Crypto}" = "x1"; then
  HAS_PYCRYPTO="True"
else
  HAS_PYCRYPTO="False"
fi
AC_SUBST(HAS_PYCRYPTO)

AC_CHECK_PYTHON_MODULE(pygments)
if test "x${PYTHON_pygments}" = "x1"; then
  HAS_PYGMENTS="True"
else
  HAS_PYGMENTS="False"
fi
AC_SUBST(HAS_PYGMENTS)

AC_LANG_PUSH([C++])
AC_CHECK_HEADER(pynac/version.h, HAS_PYNAC="True", HAS_PYNAC="False")
AC_LANG_POP([C++])
AC_SUBST(HAS_PYNAC)

AC_CHECK_PYTHON_MODULE(pyparsing)
if test "x${PYTHON_pyparsing}" = "x1"; then
  HAS_PYPARSING="True"
else
  HAS_PYPARSING="False"
fi
AC_SUBST(HAS_PYPARSING)

PKG_CHECK_MODULES(python, python-2.7, [HAS_PYTHON='True'], [HAS_PYTHON='False'])
AC_SUBST(HAS_PYTHON)

AC_CHECK_PYTHON_MODULE(zmq)
if test "x${PYTHON_zmq}" = "x1"; then
  HAS_PYZMQ="True"
else
  HAS_PYZMQ="False"
fi
AC_SUBST(HAS_PYZMQ)

AC_CHECK_PROG(HAS_R, R, "True", "False")
AC_SUBST(HAS_R)

AC_CHECK_HEADERS(ratpoints.h, HAS_RATPOINTS="True", HAS_RATPOINTS="False")
AC_SUBST(HAS_RATPOINTS)

AC_CHECK_HEADERS(readline/readline.h, HAS_READLINE="True", HAS_READLINE="False")
AC_SUBST(HAS_READLINE)

AC_CHECK_PYTHON_MODULE(rpy2)
if test "x${PYTHON_rpy2}" = "x1"; then
  HAS_RPY2="True"
else
  HAS_RPY2="False"
fi
AC_SUBST(HAS_RPY2)

AC_CHECK_PROG(HAS_RUBIKS, rubiks_cubex, "True", "False")
AC_SUBST(HAS_RUBIKS)

AC_CHECK_HEADERS(rw.h, HAS_RW="True", HAS_RW="False")
AC_SUBST(HAS_RW)

# FIXME(sagenb): doesn't work, but low priority
AC_CHECK_PYTHON_MODULE(sagenb)
if test "x${PYTHON_sagenb}" = "x1"; then
  HAS_SAGENB="True"
else
  HAS_SAGENB="False"
fi
AC_SUBST(HAS_SAGENB)

# FIXME(sagetex): doesn't install, but low priority
HAS_SAGETEX="True"
AC_SUBST(HAS_SAGETEX)

AC_CHECK_PYTHON_MODULE(scipy)
if test "x${PYTHON_scipy}" = "x1"; then
  HAS_SCIPY="True"
else
  HAS_SCIPY="False"
fi
AC_SUBST(HAS_SCIPY)

AC_CHECK_PROG(HAS_SCONS, scons, "True", "False")
AC_SUBST(HAS_SCONS)

AC_CHECK_PYTHON_MODULE(setuptools)
if test "x${PYTHON_setuptools}" = "x1"; then
  HAS_SETUPTOOLS="True"
else
  HAS_SETUPTOOLS="False"
fi
AC_SUBST(HAS_SETUPTOOLS)

# FIXME(singular): using the debian-science repository
AC_LANG_PUSH([C++])
old_CPPFLAGS=$CPPFLAGS
CPPFLAGS="$old_CPPFLAGS -I/usr/include/factory"
AC_CHECK_HEADERS(libsingular.h, HAS_SINGULAR="True", HAS_SINGULAR="False")
CPPFLAGS=$old_CPPFLAGS
AC_LANG_POP([C++])
HAS_SINGULAR="False"
AC_SUBST(HAS_SINGULAR)

AC_CHECK_PYTHON_MODULE(six)
if test "x${PYTHON_six}" = "x1"; then
  HAS_SIX="True"
else
  HAS_SIX="False"
fi
AC_SUBST(HAS_SIX)

AC_CHECK_PYTHON_MODULE(sphinx)
if test "x${PYTHON_sphinx}" = "x1"; then
  HAS_SPHINX="True"
else
  HAS_SPHINX="False"
fi
AC_SUBST(HAS_SPHINX)

AC_CHECK_HEADERS(sqlite3.h, HAS_SQLITE="True", HAS_SQLITE="False")
AC_SUBST(HAS_SQLITE)

AC_CHECK_HEADERS(symmetrica/def.h, HAS_SYMMETRICA="True", HAS_SYMMETRICA="False")
AC_SUBST(HAS_SYMMETRICA)

AC_CHECK_PROG(HAS_SYMPOW, sympow, "True", "False")
AC_SUBST(HAS_SYMPOW)

AC_CHECK_PYTHON_MODULE(sympy)
if test "x${PYTHON_sympy}" = "x1"; then
  HAS_SYMPY="True"
else
  HAS_SYMPY="False"
fi
AC_SUBST(HAS_SYMPY)

AC_CHECK_PROG(HAS_TACHYON, tachyon, "True", "False")
AC_SUBST(HAS_TACHYON)

AC_CHECK_PYTHON_MODULE(tornado)
if test "x${PYTHON_tornado}" = "x1"; then
  HAS_TORNADO="True"
else
  HAS_TORNADO="False"
fi
AC_SUBST(HAS_TORNADO)

# FIXME(zeromq): useful only for pyzmq
HAS_ZEROMQ="True"
AC_SUBST(HAS_ZEROMQ)

AC_CHECK_HEADERS(zlib.h, HAS_ZLIB="True", HAS_ZLIB="False")
AC_SUBST(HAS_ZLIB)

AC_CHECK_HEADERS(zn_poly/zn_poly.h, HAS_ZNPOLY="True", HAS_ZNPOLY="False")
AC_SUBST(HAS_ZNPOLY)

AC_OUTPUT(pruner.py)
