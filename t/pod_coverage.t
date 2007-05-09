# $Id: pod_coverage.t 2264 2007-05-09 17:06:24Z comdog $
use Test::More;
eval "use Test::Pod::Coverage 2.00";
plan skip_all => "Test::Pod::Coverage 2.00 required for testing POD coverage" if $@;
all_pod_coverage_ok(
	{ coverage_class => 'Pod::Coverage::CountParents' }
	);
																						 