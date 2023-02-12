#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;

my $domain = shift or die "Usage: $0 domain.com\n";

my $ua = LWP::UserAgent->new;
my $response = $ua->get("http://api.hackertarget.com/hostsearch/?q=$domain");

if ($response->is_success) {
    my $result = $response->decoded_content;
    print "$result\n";
} else {
    die $response->status_line;
}
