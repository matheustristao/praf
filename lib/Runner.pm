package Runner;

use Moose;
use Facade;

has 'facade' => (is => 'rw', isa => 'Facade');

sub allocate {
    my $self = shift;
    my $user = shift;
    my $resource = shift;
    $resource->user($user);
}

1;

