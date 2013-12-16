package EXT::Student;
use Moose;

extends 'PRAF::User';

has 'course' => (is => 'rw', isa => 'Str');

1;

