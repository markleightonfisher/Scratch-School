package School::Schema::Result::Assignment;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('assignment');
__PACKAGE__->add_columns(
    id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_auto_increment => 1,
    },
    name => {
        data_type         => 'text',
        is_numeric        => 0,
        is_nullable       => 0,
    },
    date_assigned => {
        data_type         => 'timestamp',
        is_numeric        => 0,
        is_nullable       => 0,
        default_value     => \'now()',
    },
    date_due => {
        data_type         => 'timestamp',
        is_numeric        => 0,
        is_nullable       => 0,
        default_value     => \'now()',
    },
    weight => {
        data_type         => 'real',
        is_numeric        => 1,
        is_nullable       => 0,
        default_value     => 1.0,
    },
    rubric => {
        data_type         => 'text',
        is_numeric        => 0,
        is_nullable       => 0,
    },
);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(
    student_assignments => 'School::Schema::Result::StudentAssignment',
    'assignment_id'
);
__PACKAGE__->many_to_many(students => 'student_assignments', 'student_id');

1;

=pod

=head1 NOTES

=over 4

=item * 'weight' exists so tests etc. can contribute more to the
overall GPA for the class.

=item * 'rubric' describes the assignment and how it is scored.

=back

=cut
