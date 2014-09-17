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

$schema->resultset('Grade')->populate([
    [qw( id status value)],
    [  -2,  0,    0 ],
    [  -1,  1,    0 ],
    [   0,  2,    0 ],
    [   1,  2,    1 ],
    [  47,  2,   47 ],
    [  58,  2,   58 ],
    [  75,  2,   75 ],
    [  81,  2,   81 ],
    [  83,  2,   83 ],
    [  84,  2,   84 ],
    [  87,  2,   87 ],
    [  91,  2,   91 ],
    [  97,  2,   97 ],
    [ 100,  2,  100 ],
]);

print "done.\n";

=pod

=head1 NOTES

=over 4

=item * Grade.id == -2 is for undefined grades.

=item * Grade.id == -1 is for incomplete grades.

=item * By convention, Grade.id == Grade.value for all assigned grades.

=back

=cut
