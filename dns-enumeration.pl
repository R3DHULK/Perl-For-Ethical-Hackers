#!/usr/bin/perl

use Net::DNS;

my $target = shift;
my $res = Net::DNS::Resolver->new;

my $query = $res->search($target);

if ($query) {
    foreach my $rr ($query->answer) {
        print $rr->string, "\n";
    }
} else {
    warn "query failed: ", $res->errorstring, "\n";
}
