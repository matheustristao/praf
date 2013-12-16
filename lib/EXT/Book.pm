package EXT::Book;
use Moose;

extends 'PRAF::Resource';

has 'title' => (is => 'rw', isa => 'Str');

1;

