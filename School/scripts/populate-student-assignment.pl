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

$schema->resultset('StudentAssignment')->populate([
    [qw( student_id assignment_id grade )],
    [  1,  1, 97 ],
    [  2,  1, 75 ],
    [  3,  2, 83 ],
    [  3,  3, 87 ],
    [  4,  2, 47 ],
    [  4,  3, 75 ],
    [  5,  2,  0 ],
    [  5,  3, 47 ],
    [ 10,  4, 75 ],
    [ 10,  5, -2 ],
    [ 10,  6, -2 ],
    [ 10,  7, -1 ],
    [ 10,  8, -2 ], 
]);

print "done.\n";
