package PRAF::Resource;
use Moose;
use PRAF::User;

has 'name' => (is => 'rw', isa => 'Str');
has 'description' => (is => 'rw', isa => 'Str');
has 'number' => (is => 'rw', isa => 'Int');
has 'user' => (is => 'rw', isa => 'PRAF::User');

1;

