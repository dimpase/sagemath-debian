#!/bin/sh
# Show sagemath's build dependencies. (You should run `mk-build-deps` first.)
# Usage: ./$0 [by-size|by-date] [extra aptitude filter]
# e.g. give ~i to only list packages installed on your system.
pkg=sagemath-build-deps
d=~R
r=~Rrecommends:

case "$1" in
by-size|by-date) subcmd="$1"; shift;;
*) subcmd="";;
esac
# 3 levels of dependencies should be enough; we also include recommends just in case
pattern="($d$pkg|$d$d$pkg|$r$d$pkg|$d$d$d$pkg|$d$r$d$pkg|$r$d$d$pkg|$r$r$d$pkg) $1"

last_updated() {
	local pkg="$1"
	local pkgname="${pkg%:*}"
	if [ -f "/usr/share/doc/$pkgname/changelog.Debian.gz" ]; then
		local changelog="/usr/share/doc/$pkgname/changelog.Debian.gz"
	else
		local changelog="/usr/share/doc/$pkgname/changelog.gz"
	fi
	echo "$(zcat "$changelog" | dpkg-parsechangelog -l- -STimestamp) $pkgname"
}

case "$subcmd" in
by-size)
LC_ALL=C aptitude search "$pattern" --disable-columns -F '%I %p' \
  | sed -e 's/ kB / KB /g' \
  | LC_ALL=C sort -k2,2 -k1n,1n \
  | sed -e 's/ KB / kB /g'
;;
by-date)
echo >&2 "by-date selected; restricting to installed packages"
LC_ALL=C aptitude search "$pattern ~i" --disable-columns -F '%p' \
  | {
	while read pkg; do
		printf >&2 "reading changelogs: $pkg                            \r"
		last_updated "$pkg"
	done
  } | sort -n | { while read t pkg; do printf "$(date -d@$t) $pkg\n"; done; }
;;
*)
LC_ALL=C aptitude search "$pattern"
;;
esac
