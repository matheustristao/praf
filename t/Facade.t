use Test::Simple tests => 6;

use PRAF::Facade;
use PRAF::User;
use PRAF::Resource;

my $user = PRAF::User->new(name => 'My Name', registrationNumber => '12345');
my $resource = PRAF::Resource->new(name => 'My Resource', description => 'This is a Test Resource', number => 1);
my $facade = PRAF::Facade->new(user => $user, resource => $resource);

ok(defined($facade) && ref $facade eq 'PRAF::Facade', "new Facade instantiated");
ok($facade->user == $user, "Facade User set correctly");
ok($facade->resource == $resource, "Facade Resource set correctly");

$facade->instantiate($user, $resource);
ok($facade->resource->user == $user, 'facade user is the same user');
$facade->create_user;
ok(pop(PRAF::User->users) == $user, 'user in the array is the right one');
$facade->create_user;
my @users = $facade->get_users;
ok(@users == 1, 'users count is 1');
#my $new_user = PRAF::User->new(name => 'My New Name', registrationNumber => '54321');
#$facade->update_user('12345', $new_user);
#my $test_user = $users[0];
#ok($test_user->registrationNumber == '54321', 'user must have been edited');
#ok(@users == 1, '@users count remain 1');

