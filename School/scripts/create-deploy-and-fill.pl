# Deploy the DBIx::Class schema to a Postgres database, then fill it.

# pragmas
use utf8;
use autodie;
use warnings;
use strict;

my @scripts = qw(
    School/scripts/create-db.pl
    School/scripts/deploy.pl
    School/scripts/populate-grade_level.pl
    School/scripts/populate-assignment.pl
    School/scripts/populate-class.pl
    School/scripts/populate-student.pl
    School/scripts/populate-student-class.pl
    School/scripts/populate-assignment-class.pl
    School/scripts/populate-student-assignment.pl
);

for my $script (@scripts) {
    system("perl $script");
}

print "\ndone.\n";
