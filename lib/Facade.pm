package Facade;

use Moose;
use User;
use Resource;
use Runner;

has 'user' => (is => 'rw', isa => 'User');
has 'resource' => (is => 'rw', isa => 'Resource');

sub instantiate {
    my $self = shift;
    my $user = shift;
    my $resource = shift;
    $self->user($user);
    $self->resource($resource);
    my $runner = Runner->new(facade => $self);
    $runner->allocate($self->user, $self->resource);
}

1;

