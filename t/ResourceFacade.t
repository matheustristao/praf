use Test::Simple tests => 3;

use PRAF::ResourceFacade;
use PRAF::Resource;

my $resource_facade = PRAF::ResourceFacade->new();
my $user = PRAF::User->new(name => 'My Name', registrationNumber => '12345');
ok(defined($resource_facade) && ref $resource_facade eq 'PRAF::ResourceFacade', "new ResourceFacade instantiated");
my $resource = $resource_facade->create_resource("My Name", "My description", 12345, $user);
ok(pop(PRAF::Resource->resources) == $resource, 'resource in the array is the right one');
$resource = $resource_facade->create_resource("My Name", "My description", 12345, $user);
my @resources = $resource_facade->get_resources;
ok(@resources == 1, 'resources count is 1');

