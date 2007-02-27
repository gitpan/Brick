# $Id: pod_coverage.t 2153 2007-02-12 04:54:55Z comdog $
use Test::More;
eval "use Test::Pod::Coverage 1.00";
plan skip_all => "Test::Pod::Coverage 1.00 required for testing POD coverage" if $@;
all_pod_coverage_ok();
																						 