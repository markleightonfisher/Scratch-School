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

$schema->resultset('StudentClass')->populate([
    [qw( student_id class_id grade override_grade_level_id )],
    [  1,  1,  97, 0 ],
    [  2,  1,  81, 0 ],
    [  3,  3,  87, 0 ],
    [  3,  4,  84, 0 ],
    [  4,  3,  58, 0 ],
    [  4,  4,  47, 0 ],
    [  5,  3,   0, 0 ],
    [  5,  4,  75, 0 ],
    [ 10,  5,  91, 0 ],
    [ 10,  6,  87, 0 ],
    [ 10,  7,  83, 0 ],
]);

print "done.\n";
