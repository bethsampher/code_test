#!/usr/bin/perl
use strict;
use warnings;

sub letter_percentage_calc {
    (my $letter) = @_;
    my $filename = "lines.txt";
    open my $file, '<', $filename;
    my @match_proportions;
    while ( my $line = <$file> ) {
        chomp $line;
        my @occurences   = $line =~ m/$letter/g;
        my $letter_matches      = scalar(@occurences);
        my $total_letters       = length($line);
        push @match_proportions,{
            letter_matches => $letter_matches,
            total_letters => $total_letters,
        };

    }
    
    close $file;
    return @match_proportions;

}

my $line_count = 0;
my $letter_matches_sum = 0;
my $total_letters_sum = 0;
foreach my $line (letter_percentage_calc("A")) {
    my $letter_percentage = $line->{letter_matches} * 100 / $line->{total_letters};
    $line_count++;
    $letter_matches_sum += $line->{letter_matches};
    $total_letters_sum += $line->{total_letters};
    print "The percentage of the letter in line $line_count is $letter_percentage%\n";
}

my $overall_percentage = $letter_matches_sum * 100 / $total_letters_sum;
print "The overall percentage of the letter is $overall_percentage%\n";

