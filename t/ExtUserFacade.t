use Test::Simple tests => 1;

use EXT::UserFacade;

my $user_facade = EXT::UserFacade->new();

ok(defined($user_facade) && ref $user_facade eq 'EXT::UserFacade', "new UserFacade instantiated");

