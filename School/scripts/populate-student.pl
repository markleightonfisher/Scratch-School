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

$schema->resultset('Student')->populate([
    [qw( student_id name surname grade_level_id gpa)],
    [ 1,  "Phred Phlobotomy", "Phlobotomy", 1, 94 ],
    [ 2,  "Danica Daring",    "Daring",     1, 78 ],
    [ 3,  "Zooba",            "Zooba",      5, 85 ],
    [ 4,  "R. Daneel Olivaw", "Olivaw",     5, 61 ],
    [ 5,  "V. M. Smith",      "Smith",      5, 47 ],
    [ 10, "Darius Daring",    "Daring",     6, 89 ],
]);

print "done.\n";
