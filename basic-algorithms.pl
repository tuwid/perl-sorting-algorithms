#!/usr/bin/perl
use Time::HiRes qw( gettimeofday );

#my @arr = ();
@a{map{int rand 1185}(1..10000000)}=();

my @array = keys %a;

print "Got random array of 10000000 \n";
#print join(' ',@arr)."\n";
#print scalar(@arr);

sub bubble_sort{
	my @arr = @_;
	my ($seconds, $bubble_start) = gettimeofday;
	for(my $i = scalar(@arr)-1; $i >= 0; $i-- ){
		for(my $j= 1; $j < $i; $j++){
			#print "current $i and $j \n";
			if($arr[$j-1] > $arr[$j] && $arr[$j] ){
				#print "$arr[$j-1] is bigger than $arr[$j].. switching $j \n";
				my $temp = $arr[$j-1]; 
				$arr[$j-1] =$arr[$j];
				$arr[$j] = $temp;
			}
		}
	}
	my ($seconds, $bubble_stop) = gettimeofday;
	my $diff = $bubble_stop - $bubble_start;
	print "Bubble Sorted in \t\t $diff x 10^-6 seconds\n";
	#print join(' ',@arr)."\n";
}


sub insertion_sort{
	my @arr = @_;
	my ($seconds, $bubble_start) = gettimeofday;
	#print join(' ',@arr);
	for(my $i= 0; $i< scalar(@arr);$i++){
		for($j = $i; $j > 0 and $arr[$j] < $arr[$j-1]; $j--){
			my $temp = $arr[$j];
			$arr[$j] = $arr[$j-1];
			$arr[$j-1] = $temp; 
		}
	} 
	my ($seconds, $bubble_stop) = gettimeofday;
	my $diff = $bubble_stop - $bubble_start;
	print "Insertion Sorted in \t\t $diff  x 10^-6 seconds \n";
	#print join(' ',@arr);
}

sub internal_sort{
	my @arr = @_;
	#print join(' ',@arr);
	#print "\n\n";
	my ($seconds, $bubble_start) = gettimeofday;
	my @ar = sort { $a <=> $b } @arr;
	my ($seconds, $bubble_stop) = gettimeofday;
	my $diff = $bubble_stop - $bubble_start;
	#print join(' ',@ar);
	print "Internal Perl Sorted in \t $diff  x 10^-6 seconds \n";
}

internal_sort(@array);

insertion_sort(@array);

bubble_sort(@array);

print "\n";