use Test::Simple tests => 3;

use PRAF::ResourceFacade;
use PRAF::Resource;

my $resource_facade = PRAF::ResourceFacade->new();
my $resource = PRAF::Resource->new(name => 'My Name',description => 'My description' ,number => '12345');
ok(defined($resource_facade) && ref $resource_facade eq 'PRAF::ResourceFacade', "new ResourceFacade instantiated");
my $resource = $resource_facade->create_resource("My Name", "My description", 12345, $user);
ok(pop(PRAF::Resource->resources) == $resource, 'resource in the array is the right one');
$resource = $resource_facade->create_resource("My Name", "My description", 12345, $user);
my @resources = $resource_facade->get_resources;
ok(@resources == 1, 'resources count is 1');

#update
ok($resouce->name eq "My Name", 'testing resource object');
$resource_facade->update_resource($resource, undef, undef);
ok($resource->name eq "My Name", 'name did not change');
$resource_facade->update_resource($resource, 'notebook', undef);
ok($resource->name eq "notebook", 'name changed');
ok($resource->description eq "My description", 'description did not change');
ok($resource->number eq "12345", 'number did not change');
ok(@resources == 1, 'resources count did not change');
$array_resource = pop(PRAF::Resource->resources);
ok($array_resource->name eq "notebook", 'array resource changed');

#delete
my @resources_arr = @{PRAF::Resource->resources};
pop(@resources_arr);
ok(scalar(@resources_arr) == 0, 'resources count is 0');
my $deleted_resources = $resource_facade->create_resource("My Name here","My description here" ,"123456");
@resources_arr = @{PRAF::Resource->resource};
ok(scalar(@resources_arr) == 1, 'resource count is 1');
$resource_facade->delete_resource($deleted_resource);
@resources_arr = @{PRAF::Resource->resources};
ok(scalar(@resources_arr) == 0, 'resource was deleted');

#testing resource array size
my $resource_1 = $resource_facade->resource("My Name here","My description here" ,"1");
my $resource_2 = $resource_facade->resource("My Name here","My description here" ,"2");
my $resource_3 = $resource_facade->resource("My Name here","My description here" ,"3");
my $resource_4 = $resource_facade->resource("My Name here","My description here" , "4");
my $resource_5 = $resource_facade->resource("My Name here","My description here" , "5");
@resources_arr = @{PRAF::Resource->resources};
ok(scalar(@resources_arr) == 5, '5 resources created');
$resource_facade->delete_resource($resource_1);
@resources_arr = @{PRAF::Resource->resources};
ok(scalar(@resources_arr) == 4, '1 resource deleted');
$resource_facade->delete_resource($resource_2);
$resource_facade->delete_resource($resource_3);
$resource_facade->delete_resource($resource_4);
$resource_facade->delete_resource($resource_5);
@resource_arr = @{PRAF::Resource->resources};
ok(scalar(@resources_arr) == 0, 'all resources removed');

