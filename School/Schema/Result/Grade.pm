package School::Schema::Result::Grade;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('grade');
__PACKAGE__->add_columns(
    id => {
        data_type         => 'integer',
        is_numeric        => 1,
        is_nullable       => 0,
        is_auto_increment => 1,
    },
    status => {
        data_type         => 'integer',
        is_numeric        => 1,
        is_nullable       => 0,
        default_value     => 0.0,
    },
    value => {
        data_type         => 'integer',
        is_numeric        => 1,
        is_nullable       => 0,
        default_value     => 0,
    },
);
__PACKAGE__->set_primary_key('id');

1;

=pod

=head1 NOTES

=over 4

=item * Because a Grade exists independent of any other table, Grade
has zero relationships. (Technically, StudentAssignment,
StudentClass, and StudentGradeLevel all have a Grade but Grade is not
linked only with any of those tables.)

=item * Business logic should limit value >= 0 && value <= 100. This
implies there can be at most 101 entries in the 'grade' table.

=item * Business logic should limit status >= 0 && status <= 2. The
values mean: 0 - undefined, 1 - incomplete, 2 - Grade.value assigned.
Grade.value is therefore only valid when Grade.status == 2.

=back

=cut
