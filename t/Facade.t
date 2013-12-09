use Test::Simple tests => 4;

use Facade;
use User;
use Resource;

my $user = User->new(name => 'My Name', registrationNumber => '12345');
my $resource = Resource->new(name => 'My Resource', description => 'This is a Test Resource', number => 1);
my $facade = Facade->new(user => $user, resource => $resource);

ok(defined($facade) && ref $facade eq 'Facade', "new Facade instantiated");
ok($facade->user == $user, "Facade User set correctly");
ok($facade->resource == $resource, "Facade Resource set correctly");

$facade->instantiate($user, $resource);
ok($facade->resource->user == $user);

