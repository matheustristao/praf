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

##this method recieves a registrationNumber and a User object
#sub update_user {
#    my $self = shift;
#    my $user_registrationNumber = shift;
#    my $new_user = shift;
#    #my @users = $self->get_users();
#    my $index_counter = 0;
#    my $is_present = -1;
#    foreach my $user (@{PRAF::User->users}) {
#        if($user->registrationNumber == $user_registrationNumber) {
#            #$user->name = $new_user->name;
#            #$user->registrationNumber = $new_user->registrationNumber;
#            $is_present = $index_counter;
#        }
#        $index_counter++;
#    }
#    my @users = @{PRAF::User->users};
#    @users[$is_present]->name = $new_user->name unless $is_present == -1;
#}

1;

