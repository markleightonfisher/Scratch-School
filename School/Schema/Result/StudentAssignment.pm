package School::Schema::Result::StudentAssignment;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('student_assignment');
__PACKAGE__->add_columns(
    student_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
    assignment_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
    grade => {
        data_type         => 'integer',
        is_nullable       => 1,
        is_numeric        => 1,
    },
);

__PACKAGE__->set_primary_key(qw( student_id assignment_id ));

__PACKAGE__->belongs_to(
    student_id => 'School::Schema::Result::Student',
    { 'foreign.student_id' => 'self.student_id' }
);
__PACKAGE__->belongs_to(
    assignment_id => 'School::Schema::Result::Assignment',
    { 'foreign.assignment_id' => 'self.assignment_id' }
);

1;

=pod

=head1 NOTES

=over 4

=item * StudentAssignment.grade is >= 0 && <= 100 for assigned grades.
'grade' == -1 for incomplete work, and 'undef' for undefined (usually
assignment is planned but not yet assigned).

=back

=cut
