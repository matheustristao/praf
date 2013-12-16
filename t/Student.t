use Test::Simple tests => 1;

use EXT::Student;

my $student = EXT::Student->new(name => 'My Name', registrationNumber => '12345');

ok(defined($student) && ref $student eq 'EXT::Student', "new student instantiated");

