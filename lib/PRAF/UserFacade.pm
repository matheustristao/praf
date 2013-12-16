package PRAF::UserFacade;

use Moose;
use PRAF::User;

sub create_user {
    my $self = shift;
    my $name = shift;
    my $registration_number = shift;
    my $user = PRAF::User->new(name => $name, registrationNumber => $registration_number);
    push(PRAF::User->users, $user);
    return $user;
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

1;

