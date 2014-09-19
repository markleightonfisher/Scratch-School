use utf8;
use autodie;
use warnings;
use strict;
use lib '.';
use School::Schema;

use Test::Most tests => 5;

my $schema = School::Schema->connect("dbi:Pg:dbname=Scratch-School");
my $student_rs;

$student_rs = $schema->resultset('Student')->search(
    { surname => { '!=', 'Joomla!' } }
);
is($student_rs->count(), 6, 'matches all because test value not in DB');

$student_rs = $schema->resultset('Student')->search(
    { surname => { '!=', \"me.name" } }
);
is($student_rs->count(), 5, 'eliminate where name eq surname');

$student_rs = $schema->resultset('Student')->search(
    { surname => 'Daring' }
);
is($student_rs->count(), 2, 'found both Daring kids');

$student_rs = $schema->resultset('Student')->search(
    { surname => { 'LIKE', 'Phl%' } }
);
is($student_rs->count(), 1, 'LIKE works');

$student_rs = $schema->resultset('Student')->search(
    {
        -and => [
            { surname => 'Daring' },
            { gpa => { '>', 80 } }
        ]
    }
);
is($student_rs->count(), 1, 'found Daring kid with better GPA');
