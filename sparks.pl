#!/usr/bin/perl

#=========================================================================
#|            ____  _  __  __   ____                                     |
#|           |  _ \(_)/ _|/ _| |  _ \ __ _ _ __ ___  ___ _ __            |
#|           | | | | | |_| |_  | |_) / _` | '__/ __|/ _ \ '__|           |
#|           | |_| | |  _|  _| |  __/ (_| | |  \__ \  __/ |              |
#|           |____/|_|_| |_|   |_|   \__,_|_|  |___/\___|_|              |
#|                                                                       |
#=========================================================================
# This script was created by Travis Sparks at the Shodor in June of 2016
# If you want to be super cool and make this 100x easier for yourself put this script in the same directory that contains your branches. If You do so, you wont have to use an absolute path when referencing your diff file!
print ("Enter the absolute path to your diff file: ") ;

$choice = <STDIN>;

print ("======================================================================= \n");

#This is opens the diff file

open(DIFFILE, "$choice") || die "\nHey there, the file location you entered is incorrect.\n";

#This actually allows the file to be printed and read

while(defined($a=<DIFFILE>)) {
        print $a;
}
print ("=======================================================================\n");

#This regex actually doesnt work very well I want to be able to extract it and the lines and be able to copy stuff exactly and precisely

print "DIFFILE"  =~  /(Only In)/;

#TODO Need to extract/count/print lines of their selected diff file
#TODO Implement a way for the user to take their selected file and have it be copied to a certain branch


sub prompt {
        my ($query) = @_; #This takes a prompt string as an argument
        local $| = 1; #this will activate autoflush so the prompt will show immediately after diff file is shown
        print $query;
        chomp(my $answer = <STDIN>);
        return $answer;
}

sub prompt_yn {
        my($query) = @_;
        my $answer = prompt("$query (Y/N): ");
        return lc($answer) eq 'y';
}

if (prompt_yn("Do you want to move a file?")){
        my $file = prompt("Enter the path to your file: \n");
        my $dest = prompt("Where do you want to move $file?: \n");
        use File::Copy;
        move ($file, $dest) || die "\nThe file or destination does not exist.\n";
        print "The file was moved successfully.\n";
}
#Aftr making the final subroutine and cleaning this code up a bit more a menu function should be added to mae it more user friendly
