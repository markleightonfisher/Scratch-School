# pragmas
use utf8;
use autodie;
use warnings;
use strict;
use lib ".";
use DBI;
use School::Schema;

# my $dbh = DBI->connect("dbi:Pg:dbname=Scratch-School");
my $schema = School::Schema->connect("dbi:Pg:dbname=Scratch-School");

$schema->deploy({ add_drop_table => 1});

print "Bonjour, Perl!\n";
