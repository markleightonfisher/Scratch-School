# pragmas
use utf8;
use autodie;
use warnings;
use strict;
use lib ".";
use DBI;
use School::Schema;

# my $dbh = DBI->connect("dbi:Pg:dbname=Scratch-School");
my $schema = School::Schema->connect("dbi:Pg:dbname=Scratch-School");

$schema->resultset('Class')->populate([
    [qw( class_id grade_level_id name)],
    [ 1,  1,  "Ms. Quail"],
    [ 2,  4,  "Ms. Partridge"],
    [ 3,  5,  "Mr. Aron - Pre-Algebra"],
    [ 4,  5,  "Mr. Zebron - Post-Algebra"],
    [ 5,  6,  "Ms. Washington - Reading"],
    [ 6,  6,  "Ms. Gonzalez - Band"],
    [ 7,  6,  "Mr. Feynman-Steinmetz - Science"],
]);

print "done.\n";
