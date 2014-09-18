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

$schema->resultset('Assignment')->populate([
    [qw( assignment_id name date_assigned date_due weight rubric)],
    [ 1,  "3.4.1 - Adding 1-digit numbers",  '9/2/2014',  '9/3/2014',   1, "ru"],
    [ 2,  "Word problems with 1 unknown",    '9/7/2014',  '9/7/2014',   1, "rubric is done"],
    [ 3,  "Salad problems with 1 anchovy",   '9/8/2014',  '9/15/2014',  1, "rubric is RUBRIC"],
    [ 4,  "Alexander and the...",            '8/19/2014', '9/2/2014',  20, "alex is the rubric"],
    [ 5,  "Diary...Dog Days",                '9/19/2014', '10/2/2014', 20, "alex is the rubric"],
    [ 6,  "Diary...Anne Frank",              '10/4/2014', '12/2/2014', 70, "anne is rubric, not alex"],
    [ 7,  "Modal Scales",                    '8/20/2014', '9/19/2014', 4,  "rubric is BLUES"],
    [ 8,  "Jazz Scales",                     '11/2/2014', '1/19/2015', 4,  "cool is the rubric"],
]);

print "done.\n";
