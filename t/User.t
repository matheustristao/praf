use Test::Simple tests => 3;

use User;

my $user = User->new(name => 'My Name', registrationNumber => '12345');

ok(defined($user) && ref $user eq 'User', "new User instantiated");
ok($user->name eq 'My Name', "User name set correctly");
ok($user->registrationNumber eq '12345', "User registrationNumber set correctly");

