# pragmas
use utf8;
use autodie;
use warnings;
use strict;
use lib ".";
use DBI;
use School::Schema;

my $dbh = DBI->connect("dbi:Pg:dbname=postgres", "postgres");
$dbh->do('create database "Scratch-School"');

print "Bonjour, Perl!\n";
