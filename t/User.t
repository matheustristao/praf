use Test::Simple tests => 3;

use PRAF::User;

my $user = PRAF::User->new(name => 'My Name', registrationNumber => '12345');

ok(defined($user) && ref $user eq 'PRAF::User', "new User instantiated");
ok($user->name eq 'My Name', "User name set correctly");
ok($user->registrationNumber eq '12345', "User registrationNumber set correctly");

