package School::Schema;
use parent 'DBIx::Class::Schema';

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->load_namespaces();

1;

=pod

=head1 NOTES

=over 4

=item * Postgres is assumed as the backing database. If you want to
switch to a different database, update the column data types in the
add_columns() calls.

=back

=cut
