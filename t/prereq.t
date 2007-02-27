# $Id: prereq.t 2153 2007-02-12 04:54:55Z comdog $
use Test::More;
eval "use Test::Prereq";
plan skip_all => "Test::Prereq required to test dependencies" if $@;
prereq_ok();
