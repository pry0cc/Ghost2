use warnings;
use strict;


my $now_playing = " ";
my $playing_status = " ";

$now_playing = `mpc --format "%title% - %artist%" | head -n 1`;
chomp($now_playing);

my $playing_raw = `mpc --format "" | head -n 2 | tail -n 1`;
my @split_raw = split(" ", $playing_raw);
$playing_status = $split_raw[0];

if($playing_status eq "[paused]") {
	$playing_status = " ";
} elsif ($playing_status eq "[playing]") {
	$playing_status = " ";
}

if($playing_status =~ /[volume]/) {
	$playing_status = "Nothing Playing";
	$now_playing = "";
}

$now_playing = "$playing_status $now_playing";

my $white_space = (123 - (length $now_playing)) / 2;

for(my $i = 0; $i < $white_space; $i++) {
	$now_playing = $now_playing." ";
} 

print "$now_playing ";
