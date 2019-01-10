#!/usr/bin/perl
use strict;
use warnings;

sub match_finder {
    (my $letter) = @_;
    my $filename = "lines.txt";
    open my $file, '<', $filename;
    my %hash;
    my @match_proportions;
    while ( my $line = <$file> ) {
        chomp $line;
        my @matches   = $line =~ m/$letter/g;
        my $letter_matches      = scalar(@matches);
        my $total_letters       = length($line);
        push @match_proportions, (
            letter_matches => $letter_matches,
            total_letters => $total_letters,
        );
    }
    
    return @match_proportions;

}
my $letter_matches_sum = 0;
my $total_letters_sum = 0;
sub percentage_calculator {
    my $line_count = 0;
    foreach my $item (match_finder("A")) {
        my $letter_percentage = $item{letter_matches} * 100 / $item{total_letters};
        $line_count++;
        $letter_matches_sum += $item{letter_matches};
        $total_letters_sum += $item{total_letters};
        print "The percentage of the letter is $letter_percentage%\n";
    }
    return;
}  

my $overall_percentage = $letter_matches_sum * 100 / $total_letters_sum;
print "The overall percentage is $overall_percentage\n";


