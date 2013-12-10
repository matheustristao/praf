use Test::Simple tests => 4;

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
ok($facade->resource->user == $user);

