#!/usr/bin/perl

use Shell qw(cat grep diff);

print("Enter the path to your diff file: ");

$choice = <STDIN>;

open(DIFFILE, "$choice") || die "\nThe file you entered does not exist, try again.\n";

print("======================================================================= \n"); #To make things look pretty :3

print(system("cat $choice"));

print("======================================================================= \n"); #To make things look pretty :3
print("\nPress enter to continue\n");
<>;
system(clear);
while(1){
print "What would you like to do?\n";
print "\n";	
print "1. View files unique to branches.\n";
print "2. View differing files.\n";
print "3. Exit.\n";

print "\nEnter you choice:\n";

chomp(my $mchoice = <STDIN>);

	if($mchoice eq '1'){
	system(clear);
	my $cmd = "cat $diff | grep 'Only'";
	print(system("$cmd"));
	}
	elsif($mchoice eq '2'){
	system(clear);
	my $cmd2 = "cat '$choice' | grep 'differ'";
	print("=======================================================================\n");
	print(system("$cmd2"));
	print("=======================================================================\n");
	}
	elsif($mchoice eq '3'){
	system(clear);
	print "Goodbye!\n";
	die;
	}	
}
