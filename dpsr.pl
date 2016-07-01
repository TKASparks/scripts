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
print "\nWhat would you like to do?\n";
print "\n";	
print "1. View files unique to branches.\n";
print "2. View differing files.\n";
print "3. Move a file.\n";
print "4. Exit.\n";

print "\nEnter you choice:\n";

chomp(my $mchoice = <STDIN>);

	if($mchoice eq '1'){
		system(clear);
		my $cmd = "grep 'Only in' $choice";;
		print("=======================================================================\n");
		print(system("$cmd"));
		print("=======================================================================\n");
		}
	elsif($mchoice eq '2'){
		system(clear);
		my $cmd2 = "grep 'differ' $choice";
		print("=======================================================================\n");
		print(system("$cmd2"));
		print("=======================================================================\n");
			sub diffthis {
				my ($question) = @_;
				local $| = 1;
				print $question;
				chomp (my $response = <STDIN>);
				return $response;
				}
			sub diffthis_yn {
				my ($question) = @_;
				my $response = diffthis("$question (Y/N): ");
				return lc($response) eq 'y';
				}
			if (diffthis_yn("Do you want to diff files between branches?")){
				my $d1 = diffthis("Enter the path to your first file: ");
				my $d2 = diffthis("Enter the path to your second file: ");
				my $cmd3 = "diff -qr $d1 $d2";
				print(system("$cmd3"));
				}
			}
	elsif($mchoice eq '3'){
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
		}
	elsif($mchoice eq '4'){
		system(clear);
		die "\nGoodbye!\n";
		}
	
}
	

