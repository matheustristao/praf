package PRAF::ResourceFacade;

use Moose;
use PRAF::Resource;

sub create_resource {
    my $self = shift;
    my $name = shift;
    my $description = shift;
    my $number = shift;
    my $user = shift;
    my $resource = PRAF::Resource->new(name => $name, description => $description, number => $number, user => $user);
    push(PRAF::Resource->resources, $resource);
    return $resource;
}

sub get_resources {
    my $self = shift;
    my @resources = PRAF::Resource->resources;
    return @resources;
}

sub update_resource {
    ...
}

sub delete_resource {
    ...
}

1;

