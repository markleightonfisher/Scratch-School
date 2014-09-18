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

$schema->resultset('GradeLevel')->populate([
    [qw( grade_level_id name grade_order)],
    [ 1,  "Preschool", 1],
    [ 2,  "Kdg.",      2],
    [ 3,  "1st",       3],
    [ 4,  "2nd",       4],
    [ 5,  "3rd",       5],
    [ 6,  "4th",       6],
    [ 7,  "5th",       7],
    [ 8,  "6th",       8],
]);

print "done.\n";
