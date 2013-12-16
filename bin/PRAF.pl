#!/bin/perl

use warnings;
use strict;
use EXT::UserFacade;
use EXT::ResourceFacade;
use PRAF::Facade;
use PRAF::User;

my $option = -1;
my $user_facade = EXT::UserFacade->new();
my $resource_facade = EXT::ResourceFacade->new();
my $facade = PRAF::Facade->new();
my $user;
my $resource;

while($option != 0) {
    print "\n";
    print "1 - Create new Student\n";
    print "2 - Create new Book\n\n";
    print "3 - List all users\n";
    print "4 - List all resources\n\n";
    print "5 - Update Student\n";
    print "6 - Update Book\n\n";
    print "7 - Remove Student\n";
    print "8 - Remove Book\n\n";
    print "8 - Allocate Resource\n\n";
    print "0 - EXIT\n";

    chomp($option = <>);

    #create student
    if($option == 1) {
        print "Enter the Student name: ";
        my $name = <>;
        print "Enter the Student registration number: ";
        my $registrationNumber = <>;
        print "Enter the Student course: ";
        my $course = <>;
        $user = $user_facade->create_user($name, $registrationNumber, 1, $course);
    }

    #List all users
    if($option == 3) {
        my $size = scalar(PRAF::User->users);
        foreach my $sample_user (0..($size)) {
            $sample_user = shift(PRAF::User->users);
            print "Name: ";
            print $sample_user->name;
            print "\n";
            print "Registration Number: ";
            print $sample_user->registrationNumber;
            print "\n";
            print "Tipo: ";
            print "Estudante\n\n" if(ref($sample_user) eq 'EXT::Student');
            push(PRAF::User->users, $sample_user);
        }
    }
}

