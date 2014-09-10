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
);
__PACKAGE__->set_primary_key(qw( student_id assignment_id ));
__PACKAGE__->belongs_to(student_id    => 'School::Schema::Result::Student');
__PACKAGE__->belongs_to(assignment_id => 'School::Schema::Result::Assignment');

1;
