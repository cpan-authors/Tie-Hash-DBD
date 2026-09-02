#!/pro/bin/perl

use strict;
use warnings;

use Getopt::Long qw(:config bundling nopermute);
GetOptions (
    "c|check"		=> \ my $check,
    "u|update!"		=> \ my $update,
    "v|verbose:1"	=> \(my $opt_v = 0),
    ) or die "usage: $0 [--check]\n";

use lib "sandbox";
use genMETA;
my $meta = genMETA->new (
    from    => "lib/Tie/Hash/DBD.pm",
    verbose => $opt_v,
    );

$meta->from_data (<DATA>);
$meta->security_md ($update);
$meta->gen_cpanfile ();

if ($check) {
    $meta->check_encoding ();
    $meta->check_required ();
    $meta->check_minimum ([ "lib", "t", "xt", "examples", "Makefile.PL" ]);
    $meta->done_testing ();
    }
elsif ($opt_v) {
    $meta->print_yaml ();
    }
else {
    $meta->fix_meta ();
    }

__END__
--- #YAML:1.0
name:                    Tie-Hash-DBD
version:                 VERSION
abstract:                Tie plain hashes to DBI interface
license:                 perl
author:
    - H.Merijn Brand <perl5@tux.freedom.nl>
generated_by:            Author
distribution_type:       module
provides:
    Tie::Hash::DBD:
        file:            lib/Tie/Hash/DBD.pm
        version:         VERSION
    Tie::Array::DBD:
        file:            lib/Tie/Array/DBD.pm
        version:         VERSION
requires:
    perl:                5.008003
    Carp:                0
    DBI:                 1.613
    Storable:            0
configure_requires:
    ExtUtils::MakeMaker: 0
configure_recommends:
    ExtUtils::MakeMaker: 7.22
configure_suggests:
    ExtUtils::MakeMaker: 7.78
test_requires:
    Test::Harness:       0
    Test::More:          0.90
    Time::HiRes:         0
recommends:
    DBI:                 1.652
    DBD::SQLite:         1.78
    DBD::Pg:             3.21.2
    DBD::CSV:            0.64
    Sereal:              5.010
    Storable:            3.41
test_recommends:
    Test::More:          1.302224
resources:
    license:             http://dev.perl.org/licenses/
    repository:          https://github.com/Tux/Tie-Hash-DBD
    bugtracker:          https://github.com/Tux/Tie-Hash-DBD/issues
meta-spec:
    version:             1.4
    url:                 http://module-build.sourceforge.net/META-spec-v1.4.html
