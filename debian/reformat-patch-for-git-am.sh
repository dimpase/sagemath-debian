#!/bin/sh
# Hacky script to make it easier to forward our patches upstream, using git-am
sed \
  -e 's/^Description: /Subject: /g' \
  -e 's/^Author: /From: /g' \
  -e '/^Forwarded: /d' \
  -e 's,^--- a/sage/,--- a/,g' \
  -e 's,^+++ b/sage/,+++ b/,g' \
  -e '/^---$/d' \
  -e '/^This patch header follows DEP-3/d' \
  "$1"
echo >&2 "You will still need to edit extended Description stanzas to put them after the"
echo >&2 "email headers, separated by 1 blank line, and de-indent them by 1 space."
