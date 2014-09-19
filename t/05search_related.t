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
        'me.surname' => 'Daring',
        'me.grade_level_id' => { '>', 1 }
    },
    {
        prefetch => 'student_assignments'
    }
);

foreach my $student ($student_rs->all()) {
    my $assignments = $student->search_related_rs(
        'student_assignments'
    );
    foreach my $assignment ($assignments->all()) {
        print "    " . $assignment->assignment_id->name . "\n";
        print "    " . $assignment->assignment_id->date_assigned . "\n";
        print "    " . $assignment->assignment_id->date_due . "\n";
        print "    " . $assignment->assignment_id->weight . "\n";
        print "    " . $assignment->assignment_id->rubric . "\n\n";
    }
}
