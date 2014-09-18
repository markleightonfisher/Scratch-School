package School::Schema::Result::AssignmentClass;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('assignment_class');
__PACKAGE__->add_columns(
    assignment_id => {
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
);

__PACKAGE__->set_primary_key(qw( assignment_id class_id ));

__PACKAGE__->belongs_to(
    class_id => 'School::Schema::Result::Class',
    { 'foreign.class_id' => 'self.class_id' }
);
__PACKAGE__->belongs_to(
    assignment_id => 'School::Schema::Result::Assignment',
    { 'foreign.assignment_id' => 'self.assignment_id' }
);

1;

=pod

=cut
