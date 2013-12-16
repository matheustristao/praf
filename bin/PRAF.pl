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
    print "5 - Update User\n";
    print "6 - Update Resource\n\n";
    print "7 - Remove User\n";
    print "8 - Remove Resource\n\n";
    print "9 - Allocate Resource\n\n";
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
        my $size = scalar(@{PRAF::User->users}) - 1;
        foreach my $sample_user (0..($size)) {
            $sample_user = shift(PRAF::User->users);
            print "Name: ";
            print $sample_user->name;
            print "Registration Number: ";
            print $sample_user->registrationNumber;
            print "Tipo: ";
            print "Estudante\n\n" if(ref($sample_user) eq 'EXT::Student');
            push(PRAF::User->users, $sample_user);
        }
    }

    #Update user
    if($option == 5) {
        print "Enter the User Registration number: ";
        my $update_reg_number = <>;
        my $size = scalar(@{PRAF::User->users}) - 1;
        foreach my $sample_user (0..($size)) {
            $sample_user = shift(PRAF::User->users);
            if($sample_user->registrationNumber == $update_reg_number) {
                print "new name: ";
                my $temp_name = <>;
                print "new registration number: ";
                my $temp_reg_num = <>;
                $user_facade->update_user($sample_user, $temp_name, $temp_reg_num);
            }
            push(PRAF::User->users, $sample_user);
        }
    }

    #Delete user
    if($option == 7) {
        print "Enter the User Registration number: ";
        my $remove_reg_number = <>;
        my $size = scalar(@{PRAF::User->users}) - 1;
        foreach my $sample_user (0..($size)) {
            $sample_user = shift(PRAF::User->users);
            if($sample_user->registrationNumber == $remove_reg_number) {
                $user_facade->delete_user($sample_user);
                print "User removed\n";
                last;
            }
            push(PRAF::User->users, $sample_user);
        }
    }

    #Allocate resource
    if($option == 9) {
        print "Enter the User Registration number: ";
        my $allocate_reg_number = <>;
        my $size = scalar(@{PRAF::User->users}) - 1;
        foreach my $sample_user (0..($size)) {
            $sample_user = shift(PRAF::User->users);
            if($sample_user->registrationNumber == $allocate_reg_number) {
                $user = $sample_user;
                print "ok, got an user!\n";
            }
            push(PRAF::User->users, $sample_user);
        }

        print "Enter the resource number: ";
        my $allocate_number = <>;
        my $r_size = scalar(@{PRAF::Resource->resources}) - 1;
        foreach my $sample_resource (0..($r_size)) {
            $sample_resource = shift(PRAF::Resource->resources);
            if($sample_resource->number == $allocate_number) {
                $resource = $sample_resource;
                print "ok, got a resource!\n";
            }
            push(PRAF::User->users, $sample_resource);
        }

        $facade->allocate($user, $resource);
    }
}

