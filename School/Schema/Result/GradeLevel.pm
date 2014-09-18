package School::Schema::Result::GradeLevel;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('grade_level');
__PACKAGE__->add_columns(
    grade_level_id => {
        data_type         => 'serial',
        is_nullable       => 0,
        is_numeric        => 1,
    },
    name => {
        data_type         => 'text',
        is_numeric        => 0,
        is_nullable       => 0,
    },
    grade_order => {
        data_type         => 'integer',
        is_numeric        => 1,
        is_nullable       => 0,
    },
);

__PACKAGE__->set_primary_key('grade_level_id');

__PACKAGE__->has_many(
    classes => 'School::Schema::Result::Class',
    { 'foreign.grade_level_id' => 'self.grade_level_id' }
);

__PACKAGE__->has_many(
    students => 'School::Schema::Result::Student',
    { 'foreign.grade_level_id' => 'self.grade_level_id' }
);

1;

=pod

=head1 NOTES

=over 4

=item * 'grade_order' is so you can display 'Preschool, Kindergarten, 1st ...'

=back

=cut
