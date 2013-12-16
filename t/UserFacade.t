use Test::Simple tests => 3;

use PRAF::UserFacade;
use PRAF::User;

my $user_facade = PRAF::UserFacade->new();
ok(defined($user_facade) && ref $user_facade eq 'PRAF::UserFacade', "new UserFacade instantiated");
my $user = $user_facade->create_user("My Name", "12345");
ok(pop(PRAF::User->users) == $user, 'user in the array is the right one');
$user = $user_facade->create_user("My Name", "12345");
my @users = $user_facade->get_users;
ok(@users == 1, 'users count is 1');

