#!/usr/bin/perl
use strict;
use warnings;

# Percs = $(transmission-remote 192.168.0.28 -l | awk '{ print $2 }' | grep % | sed ':a;N;$!ba;s/\n/ /g')
# File_names = $(transmission-remote 192.168.0.28 -l | awk '{ print $13 }' | sed ':a;N;$!ba;s/\n/ /g')

# my $a = `./perc`;
# my $b = `./file_names`;

# my @data = ($a, $b);


# transmission-remote 192.168.0.28 -l | awk '{ print $2 }' | grep % | sed ':a;N;$!ba;s/\n/ /g'

my $total = 0;
my $average = 0;
my $rounded;

for(@ARGV) {
	$total += $_;
}

if(scalar(@ARGV) != 0) { 
	$average = $total / scalar(@ARGV);
}

if($average != 0) {
	$rounded = sprintf "%.3f", $average;
	if ($rounded != 100.000) {
		print "TORRENT: $rounded%\n" ;
	} else {
		print "ALL COMPLETE\n";
	}
	
} else {
	print "NO DOWNLOADS\n";
}

