package PRAF::User;
use Moose;

has 'name' => (is => 'rw', isa => 'Str');
has 'registrationNumber' => (is => 'rw', isa => 'Str');
#has 'users' => (traits => [qw( Array )], is => 'rw', isa => 'ArrayRef[PRAF::User]', default => sub { [] }, handles => {push_user => 'push', count_users => 'count', find_user => 'first'});

my @users;
sub users {
    my $users_ref = \@users;
    return $users_ref;
}

1;

