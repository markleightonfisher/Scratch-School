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
    grade_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
    override_grade_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
    },
);
__PACKAGE__->set_primary_key(qw( student_id class_id ));
__PACKAGE__->belongs_to(student_id => 'School::Schema::Result::Student');
__PACKAGE__->belongs_to(class_id   => 'School::Schema::Result::Class');
__PACKAGE__->has_one(
    grade_id => 'School::Schema::Result::Grade',
    { 'foreign.id' => 'self.grade_id' }
);

1;

=pod

=head1 NOTES

=over 4

=item * Business logic should use 'override_grade_id' to indicate
that student 'student_id' can take class 'class_id' even though
that class is not in that student's grade level.

=back

=cut
