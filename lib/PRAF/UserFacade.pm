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
    my $self = shift;
    my $user = shift;
    my $name = shift;
    my $registrationNumber = shift;
    $user->{name} = $name if defined($name);
    $user->{registrationNumber} = $registrationNumber if defined($registrationNumber);
}

sub delete_user {
    my $self = shift;
    my $user = shift;
    my @users = $self->get_users();
    foreach my $test_user (0..(@users-1)) {
        $test_user = shift PRAF::User->users;
        push(PRAF::User->users, $test_user) unless $test_user->registrationNumber eq $user->{registrationNumber};
    }
}

1;

