use feature qw(say);
use strict;
use warnings;
use utf8;
use ExtUtils::MakeMaker; # for XSMULTI option
use ExtUtils::PkgConfig;

my $package = "augeas";
my %pkg_info = ExtUtils::PkgConfig->find ($package);
say "augeas modversion:  $pkg_info{modversion}";
say "augeas cflags:      $pkg_info{cflags}";
say "augeas libs:        $pkg_info{libs}";

WriteMakefile(
  NAME          => 'Config::Augeas',
  VERSION_FROM  => 'lib/Config/Augeas.pm',
  PREREQ_PM     => { 'ExtUtils::MakeMaker' => '7.12' },
  ABSTRACT_FROM => 'lib/Config/Augeas.pm',
  AUTHOR        => 'Raphaël Pinson (raphink at cpan dot org)',
  LICENSE       => 'lgpl',
  LIBS          => [$pkg_info{libs}],
  INC           => $pkg_info{cflags},
);