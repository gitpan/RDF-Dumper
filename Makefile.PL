
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'dump RDF data objects',
  'AUTHOR' => 'Jakob Voss',
  'BUILD_REQUIRES' => {
    'English' => '0',
    'RDF::Trine' => '0',
    'RDF::Trine::Model' => '0',
    'RDF::Trine::Parser' => '0',
    'Test::More' => '0',
    'utf8' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'RDF-Dumper',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'RDF::Dumper',
  'PREREQ_PM' => {
    'Carp' => '0',
    'RDF::Trine::Serializer' => '0',
    'Scalar::Util' => '0'
  },
  'VERSION' => '0.1',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



