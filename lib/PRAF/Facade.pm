package PRAF::Facade;

use Moose;
use PRAF::User;
use PRAF::Resource;
use PRAF::Runner;

has 'user' => (is => 'rw', isa => 'PRAF::User');
has 'resource' => (is => 'rw', isa => 'PRAF::Resource');

sub instantiate {
    my $self = shift;
    my $user = shift;
    my $resource = shift;
    $self->user($user);
    $self->resource($resource);
    my $runner = PRAF::Runner->new(facade => $self);
    $runner->allocate($self->user, $self->resource);
}

1;

