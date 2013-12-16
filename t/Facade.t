use Test::Simple tests => 2;

use PRAF::Facade;
use PRAF::User;
use PRAF::Resource;

my $user = PRAF::User->new(name => 'My Name', registrationNumber => '12345');
my $resource = PRAF::Resource->new(name => 'My Resource', description => 'This is a Test Resource', number => 1);
my $facade = PRAF::Facade->new();

ok(defined($facade) && ref $facade eq 'PRAF::Facade', "new Facade instantiated");
$facade->allocate($user, $resource);
ok($resource->user == $user);

