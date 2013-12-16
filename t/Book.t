use Test::Simple tests => 1;

use EXT::Book;

my $book = EXT::Book->new(name => 'My Name', description => 'book 1', number => 2);

ok(defined($book) && ref $book eq 'EXT::Book', "new Book instantiated");

