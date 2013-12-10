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

sub create_user {
    my $self = shift;
    push(PRAF::User->users, $self->user);
}

sub get_users {
    my $self = shift;
    my @users = PRAF::User->users;
    return @users;
}

sub update_user {
    ...
}

sub delete_user {
    ...
}

sub create_resource {
    ...
}

sub get_resource {
    ...
}

sub update_resource {
    ...
}

sub delete_resource {
    ...
}

1;

