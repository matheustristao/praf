use Test::Simple tests => 1;

use EXT::ResourceFacade;

my $resource_facade = EXT::ResourceFacade->new();

ok(defined($resource_facade) && ref $resource_facade eq 'EXT::ResourceFacade', "new ResourceFacede instantiated");

