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

=item * Student.grade_affinity is the affinity a student has for a
grade. For elementary students, the grade affinity means that the
students normally are in one class in one grade. It is called
'affinity' so it is clear that, on a case-by-case basis, students can
take classes outside of their normal grade level -- for example, a
seventh-grade student allowed to take ninth-grade algebra at the high
school.

=back

=cut
