#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket;

my $host = $ARGV[0];
my $start_port = $ARGV[1];
my $end_port = $ARGV[2];

for my $port ($start_port..$end_port) {
    my $socket = IO::Socket::INET->new(
        Proto    => "tcp",
        PeerAddr => $host,
        PeerPort => $port,
        Timeout  => 1,
    );

    if ($socket) {
        print "  ✔️✔️ Port $port is open ✔️✔️\n";
        close($socket);
    }else{
        print " ✖️✖️ Port $port is closed ✖️✖️\n";
    }
}
