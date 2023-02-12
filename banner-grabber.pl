#!/usr/bin/perl

use strict;
use warnings;
use IO::Socket::INET;

my $host = shift || die "Usage: $0 host\n";
my $port = shift || 80;

my $socket = IO::Socket::INET->new(
    PeerAddr => $host,
    PeerPort => $port,
    Proto => 'tcp',
    Timeout => 10
) or die "Could not connect to $host:$port: $!";

$socket->send("GET / HTTP/1.0\r\n\r\n");

while (my $line = <$socket>) {
    print $line;
}

close $socket;
