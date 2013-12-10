use Test::Simple tests => 8;

use PRAF::Resource;
use PRAF::User;

my $user = PRAF::User->new(name => 'My Name', registrationNumber => '12345');
my $resource = PRAF::Resource->new(name => 'My Resource', description => 'This is a Test Resource', number => 1, user => $user);

ok(defined($resource) && ref $resource eq 'PRAF::Resource', "new Resource instantiated");
ok($resource->name eq 'My Resource', "Resource name set correctly");
ok($resource->description eq 'This is a Test Resource', "Resource description set correctly");
ok($resource->number == 1, "Resource number set correctly");
ok($resource->user == $user, "Resource user set correctly");
ok(defined($resource->user) && ref $resource->user eq 'PRAF::User', "new Resource User instantiated");
push(PRAF::Resource->resources, $resource);
undef $resource;
ok(not defined($resource));
$resource = pop(PRAF::Resource->resources);
ok(defined($resource) && ref $resource eq 'PRAF::Resource', "new Resource instantiated");

