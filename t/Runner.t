use Test::Simple tests => 2;

use Runner;
use Facade;
use User;
use Resource;

my $user = User->new(name => 'My Name', registrationNumber => '12345');
my $resource = Resource->new(name => 'My Resource', description => 'This is a Test Resource', number => 1);
my $facade = Facade->new(user => $user, resource => $resource);
my $runner = Runner->new(facade => $facade);

ok(defined($runner) && ref $runner eq 'Runner', "new Runner instantiated");
$runner->allocate($user, $resource);
ok($facade->resource->user == $user);

