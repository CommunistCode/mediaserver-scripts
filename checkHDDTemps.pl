#! /usr/bin/perl

open FILE, "/proc/mdstat" or die "couldn't open file";

my $file = <FILE>;
my $file = <FILE>;

while ($file =~ m/sd.{1}/g) {
  
  print `sudo hddtemp /dev/$&`;

}
