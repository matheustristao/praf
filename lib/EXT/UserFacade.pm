package EXT::UserFacade;
use Moose;

use PRAF::User;

use EXT::Student;

extends 'PRAF::UserFacade';

override 'create_user' => sub {
    my $self = shift;
    my $name = shift;
    my $registrationNumber = shift;
    my $type = shift;

    if($type == 1) {
        my $course = shift;
        my $user = EXT::Student->new(name => $name, registrationNumber => $registrationNumber, course => $course);
    push(PRAF::User->users, $user);
        return $user;
    }
    #insert your new user types here!!!

    else {
        die "type not found";
    }
}

