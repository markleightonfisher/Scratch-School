package School::Schema::Result::StudentClass;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('student_class');
__PACKAGE__->add_columns(
    student_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
    class_id => {
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
    override_grade_level_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
    },
);

__PACKAGE__->set_primary_key(qw( student_id class_id ));

__PACKAGE__->belongs_to(
    class_id => 'School::Schema::Result::Class',
    { 'foreign.class_id' => 'self.class_id' }
);
__PACKAGE__->belongs_to(
    student_id => 'School::Schema::Result::Student',
    { 'foreign.student_id' => 'self.student_id' }
);

1;

=pod

=head1 NOTES

=over 4

=item * 'grade' is >= 0 && <= 100 for assigned grades. 'grade' == -1
for incomplete work, and 'undef' for undefined.

=item * Business logic should use 'override_grade_level_id' to indicate
that student 'student_id' can take class 'class_id' even though that
class is not at that student's grade level. 'override_grade_level_id'
is in StudentClass so these overrides can be performed on a
student-by-student and class-by-class basis.

=back

=cut
