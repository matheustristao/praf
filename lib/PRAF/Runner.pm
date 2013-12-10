package PRAF::Runner;

use Moose;
use PRAF::Facade;

has 'facade' => (is => 'rw', isa => 'PRAF::Facade');

sub allocate {
    my $self = shift;
    my $user = shift;
    my $resource = shift;
    $resource->user($user);
}

1;

