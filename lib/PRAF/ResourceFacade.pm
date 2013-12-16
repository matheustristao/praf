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
    my $self = shift;
    my $resource = shift;
    my $name = shift;
    my $description = shift;
    my $number = shift;
    my $user = shift;
    $resource->{name} = $name if defined($name);
    $resource->{description} = $description if defined($description);
    $resource->{number} = $number if defined($number);	
    $resource->{user} = $user if defined($user);
}

sub delete_resource {
    my $self = shift;
    my $resource = shift;
    my @resources = $self->get_resources();
    foreach my $test_resource (0..(@resources-1)) {
        $test_resource = shift PRAF::Resource->resources;
        push(PRAF::Resource->resources, $test_resource) unless $test_resource->number eq $resource->{number};
    }
}

1;

