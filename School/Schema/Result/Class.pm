package School::Schema::Result::Class;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('class');
__PACKAGE__->add_columns(
    class_id => {
        data_type         => 'serial',
        is_nullable       => 0,
        is_numeric        => 1,
    },
    grade_level_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
    name => {
        data_type         => 'text',
        is_numeric        => 0,
        is_nullable       => 0,
    },
);

__PACKAGE__->set_primary_key('class_id');

__PACKAGE__->belongs_to(
    grade_level => 'School::Schema::Result::GradeLevel',
    { 'foreign.grade_level_id' => 'self.grade_level_id' }
);

__PACKAGE__->has_many(
    student_classes => 'School::Schema::Result::StudentClass',
    { 'foreign.class_id' => 'self.class_id' }
);

__PACKAGE__->many_to_many(students => 'student_classes', 'student_id');

1;
