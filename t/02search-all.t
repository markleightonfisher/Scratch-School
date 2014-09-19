use utf8;
use autodie;
use warnings;
use strict;
use lib '.';
use School::Schema;

use Test::Most tests => 4;

my $schema = School::Schema->connect("dbi:Pg:dbname=Scratch-School");

my %danica_daring = (
    name           => 'Danica Daring',
    surname        => 'Daring',
    grade_level_id => 1,
    gpa            => 78,
);
my @surnames = (
    'Phlobotomy',
    'Daring',
    'Zooba',
    'Olivaw',
    'Smith',
    'Daring',
);

my $student_rs = $schema->resultset('Student')->search();

my $count_cols       = 0;
my $count_rows       = 0;
my $count_row_values = 0;
my $found_surname    = 0;
while (my $student = $student_rs->next()) {
    $count_rows++;

    if ($student->surname eq 'Phlobotomy') {
        $found_surname++;
    }

    if ($student->name eq 'Danica Daring') {
        for my $key (sort keys %danica_daring) {
            if ($student->get_column($key) eq $danica_daring{$key}) {
                $count_cols++;
            }
        }
    }

    my $surname = $student->surname;
    if (scalar grep {/^$surname$/} @surnames) {
        $count_row_values++;
    }
}

is($count_rows, 6, 'we have correct number of students');
ok($found_surname, 'found correct student attribute value');
is($count_cols, scalar keys %danica_daring, 'found a complete row');
is($count_row_values, scalar @surnames, 'found values in all rows');
