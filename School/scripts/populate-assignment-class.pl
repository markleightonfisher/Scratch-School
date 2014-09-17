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

$schema->resultset('AssignmentClass')->populate([
    [qw( assignment_id class_id )],
    [  1, 1 ],
    [  2, 3 ],
    [  3, 4 ],
    [  4, 5 ],
    [  5, 5 ],
    [  6, 5 ],
    [  7, 6 ],
    [  8, 6 ],
]);

print "done.\n";
