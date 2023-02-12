#!/usr/bin/perl

use strict;
use warnings;

print "Enter the network interface (e.g. eth0): ";
my $interface = <STDIN>;
chomp $interface;

print "Enter the new MAC address (e.g. 00:11:22:33:44:55): ";
my $new_mac = <STDIN>;
chomp $new_mac;

# Bring the interface down
system("ifconfig $interface down");

# Change the MAC address
system("ifconfig $interface hw ether $new_mac");

# Bring the interface up
system("ifconfig $interface up");
