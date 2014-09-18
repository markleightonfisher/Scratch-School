package School::Schema::Result::Student;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('student');
__PACKAGE__->add_columns(
    student_id => {
        data_type         => 'serial',
        is_nullable       => 0,
        is_numeric        => 1,
    },
    name => {
        data_type         => 'text',
        is_numeric        => 0,
        is_nullable       => 0,
    },
    surname => {
        data_type         => 'text',
        is_numeric        => 0,
        is_nullable       => 0,
    },
    grade_level_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
    gpa => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
);

__PACKAGE__->set_primary_key('student_id');

__PACKAGE__->belongs_to(
    grade_levels => 'School::Schema::Result::GradeLevel',
    { 'foreign.grade_level_id' => 'self.grade_level_id' }
);

__PACKAGE__->has_many(
    student_assignments => 'School::Schema::Result::StudentAssignment',
    { 'foreign.student_id' => 'self.student_id' }
);
__PACKAGE__->has_many(
    student_classes => 'School::Schema::Result::StudentClass',
    { 'foreign.student_id' => 'self.student_id' }
);

__PACKAGE__->many_to_many( assignments => 'student_assignments', 'assignment_id');
__PACKAGE__->many_to_many( classes     => 'student_classes',     'class_id');

1;

=pod

=head1 NOTES

=over 4

=item * 'surname' (family name) is used for sorting students by name.
In the event that a student has but a single name (like 'Madonna'),
both 'surname' and 'name' would contain the same value.

=back

=cut
