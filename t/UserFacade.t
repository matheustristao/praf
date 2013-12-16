use Test::Simple tests => 12;

use PRAF::UserFacade;
use PRAF::User;

my $user_facade = PRAF::UserFacade->new();
ok(defined($user_facade) && ref $user_facade eq 'PRAF::UserFacade', "new UserFacade instantiated");
my $user = $user_facade->create_user("My Name", "12345");
ok(pop(PRAF::User->users) == $user, 'user in the array is the right one');
$user = $user_facade->create_user("My Name", "12345");
my @users = $user_facade->get_users;
ok(@users == 1, 'users count is 1');

#update
ok($user->name eq "My Name", 'testing user object');
$user_facade->update_user($user, undef, undef);
ok($user->name eq "My Name", 'name did not change');
$user_facade->update_user($user, 'Pedro', undef);
ok($user->name eq "Pedro", 'name changed');
ok($user->registrationNumber eq "12345", 'reg number did not change');
ok(@users == 1, 'users count did not change');
$array_user = pop(PRAF::User->users);
ok($array_user->name eq "Pedro", 'array user changed');

#delete
my @users_arr = @{PRAF::User->users};
pop(@user_arr);
ok(scalar(@users_arr) == 0, 'users count is 0');
my $deleted_user = $user_facade->create_user("My Name here", "123456");
@users_arr = @{PRAF::User->users};
ok(scalar(@users_arr) == 1, 'users count is 1');
$user_facade->delete_user($deleted_user);
@users_arr = @{PRAF::User->users};
ok(scalar(@users_arr) == 0, 'user was deleted');

