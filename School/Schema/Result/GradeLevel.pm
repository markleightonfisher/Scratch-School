package School::Schema::Result::GradeLevel;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('grade_level');
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
    order => {
        data_type         => 'integer',
        is_numeric        => 1,
        is_nullable       => 0,
    },
);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(classes => 'School::Schema::Result::Class', 'id');

1;

=pod

=head1 NOTES

=over 4

=item * 'order' is so you can display 'Preschool, Kindergarten, 1st ...'

=back

=cut
