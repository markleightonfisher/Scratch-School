use utf8;
use autodie;
use warnings;
use strict;
use lib '.';
use School::Schema;

use Test::Most tests => 4;

my $schema = School::Schema->connect("dbi:Pg:dbname=Scratch-School");

my $student_rs = $schema->resultset('Student')->search(
    {
        -and => [
            { 'me.surname' => 'Daring' },
            { 'me.grade_level_id' => { '>', 1 } }
        ]
    },
    {
        prefetch => 'student_assignments'
    }
);

my $assignments_completed = 0;
my $assignment_count      = 0;
my $found_darius_daring   = 0;
while (my $student = $student_rs->next()) {
    if ($student->name           eq 'Darius Daring'
     && $student->surname        eq 'Daring'
     && $student->grade_level_id == 6
     && $student->gpa            == 89) {
        $found_darius_daring++;
    }
    for my $assignment ($student->student_assignments->all) {
        $assignment_count++;
        if ($assignment->grade >= 0) {
            $assignments_completed++;
        }
    }
}
is($student_rs->count(),   1, 'found only 1 kid');
is($found_darius_daring,   1, 'kid is Darius Daring');
is($assignment_count,      5, 'all assignments found');
is($assignments_completed, 1, '1 assignment done and turned in');
