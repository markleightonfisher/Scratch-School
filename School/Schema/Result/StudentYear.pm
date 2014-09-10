package School::Schema::Result::StudentYear;
use parent qw( DBIx::Class::Core );

use utf8;
use autodie;
use warnings;
use strict;

__PACKAGE__->table('student_year');
__PACKAGE__->add_columns(
    student_id => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
    year => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
    },
    gpa => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
        is_foreign_key    => 1,
    },
    grade_level => {
        data_type         => 'integer',
        is_nullable       => 0,
        is_numeric        => 1,
    },
);
__PACKAGE__->set_primary_key(qw( student_id year ));
__PACKAGE__->belongs_to(student_id => 'School::Schema::Result::Student');
#__PACKAGE__->has_one(   gpa        => 'School::Schema::Result::Grade');

1;

=pod

=head1 NOTES

=over 4

=item * 'gpa' is a foreign key to Grade.id representing the GPA.

=item * Business logic should limit the value of 'year'.

=item * 'grade_level' is the grade level, most commonly expressed as
1st grade, 4th grade, etc.

=item * Using StudentYear allows for students repeating grade(s).

=back

=cut
