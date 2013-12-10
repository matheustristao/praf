use Test::Simple tests => 2;

use PRAF::Runner;
use PRAF::Facade;
use PRAF::User;
use PRAF::Resource;

my $user = PRAF::User->new(name => 'My Name', registrationNumber => '12345');
my $resource = PRAF::Resource->new(name => 'My Resource', description => 'This is a Test Resource', number => 1);
my $facade = PRAF::Facade->new(user => $user, resource => $resource);
my $runner = PRAF::Runner->new(facade => $facade);

ok(defined($runner) && ref $runner eq 'PRAF::Runner', "new Runner instantiated");
$runner->allocate($user, $resource);
ok($facade->resource->user == $user);

