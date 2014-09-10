package School::Schema::Result::Student;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('student');
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
    surname => {
        data_type         => 'text',
        is_numeric        => 0,
        is_nullable       => 0,
    },
    grade_affinity => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to(classes     => 'School::Schema::Result::Class',      'id');

1;
