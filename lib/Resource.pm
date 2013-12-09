package Resource;
use Moose;
use User;

has 'name' => (is => 'rw', isa => 'Str');
has 'description' => (is => 'rw', isa => 'Str');
has 'number' => (is => 'rw', isa => 'Int');
has 'user' => (is => 'rw', isa => 'User');

1;

