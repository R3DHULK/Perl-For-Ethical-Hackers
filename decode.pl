#!/usr/bin/perl
use strict;
use warnings;

my $input_image = $ARGV[0];

open my $in_fh, "<", $input_image or die $!;
binmode $in_fh;
my $image = do { local $/; <$in_fh> };

my $message_length_bits = substr($image, 0, 64);
my $message_length = unpack("Q", pack("B64", $message_length_bits));
my $message_bits = substr($image, 64, $message_length);
my $message = pack("B*", $message_bits);

print $message;
