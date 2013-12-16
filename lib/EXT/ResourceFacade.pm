package EXT::ResourceFacade;
use Moose;

extends 'PRAF::ResourceFacade';

override 'create_resource' => sub {
    my $self = shift;
    my $name = shift;
    my $description = shift;
    my $number = shift;
    my $user = shift;
    my $type = shift;

    if($type == 1) {
        my $title = shift;
        my $resource = EXT::Book->new(name => $name, description => $description, number => $number, title => $title);
    push(PRAF::Resource->resources, $resource);
        return $resource;
    }
    #insert your new resources types here!!!

    else {
        die "type not found";
    }
}

