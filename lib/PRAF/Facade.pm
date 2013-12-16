package PRAF::Facade;

use Moose;
use PRAF::User;
use PRAF::Resource;

sub allocate {
    my $self = shift;
    my $user = shift;
    my $resource = shift;
    $resource->user($user);
}

1;

