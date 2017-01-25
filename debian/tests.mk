#!/usr/bin/make -f
# Makefile containing shell snippets to help with running sage tests and
# analysing the output.
#
# TODO: eventually call this from an autopkgtest

SAGE = sage
SAGE_TEST_FLAGS =
LOGFILE = ptestlong.log

check:
	$(SAGE) -t -p --all --long --logfile=$(LOGFILE) $(SAGE_TEST_FLAGS)

check-failed:
	$(SAGE) -t -p --all --long --logfile=$(LOGFILE) -f $(SAGE_TEST_FLAGS)

FAILED_TESTS = grep '^sage -t .*  \#' $(LOGFILE)
failed-tests:
	$(FAILED_TESTS)

failed-tests-total-normal:
	grep "^Failed example:" $(LOGFILE) | wc -l

failed-tests-special:
	$(FAILED_TESTS) | grep '# [^0-9]' || true

failed-tests-by-name:
	$(FAILED_TESTS) | sort '-t#' -k1

failed-tests-by-count:
# Sort "special" failures last, e.g. segfault/abort/timed-out etc
	$(FAILED_TESTS) \
	  | sed -e 's,#\(\s\s*[^0-9]\),#9999999\1,g' \
	  | sort '-t#' -k2n,2n \
	  | sed -e 's,9999999,,g'

failed-tests-by-error:
# Filter out NameError; most of these are caused by earlier errors
	grep '\(Error\|Warning\):' $(LOGFILE) \
	  | grep -v NameError \
	  | sort | uniq -c | sort -k1n,1n

FT_CAUSE_ERRORTYPE = \(Error\|Warning\)
FT_CAUSE_BACKTRACE = 2
failed-tests-by-cause:
	grep -B$$((2 * $(FT_CAUSE_BACKTRACE))) -Z '$(FT_CAUSE_ERRORTYPE):' $(LOGFILE) \
	  | sed -e 's/^--$$/\x00/g' \
	  | sed -z -e 's/^\s*//g' \
	  | tr '\0\n' '\n\t' \
	  | sort | uniq -c | sort -k1n,1n \
	  | less -S +G
