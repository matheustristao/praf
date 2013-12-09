package User;
use Moose;

has 'name' => (is => 'rw', isa => 'Str');
has 'registrationNumber' => (is => 'rw', isa => 'Str');

1;
