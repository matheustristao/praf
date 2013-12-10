package PRAF::User;
use Moose;

has 'name' => (is => 'rw', isa => 'Str');
has 'registrationNumber' => (is => 'rw', isa => 'Str');

my @users;
sub users {
    my $users_ref = \@users;
    return $users_ref;
}

1;

