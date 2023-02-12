#!/usr/bin/perl
use strict;
use warnings;

my $input_image = $ARGV[0];
my $output_image = $ARGV[1];
my $message = $ARGV[2];

open my $in_fh, "<", $input_image or die $!;
binmode $in_fh;
my $image = do { local $/; <$in_fh> };

my $message_bits = unpack("B*", $message);
my $message_length = length($message_bits);
my $message_length_bits = sprintf("%064b", $message_length);

substr($image, 0, 64, $message_length_bits);
for (my $i = 0; $i < length($message_bits); $i++) {
  substr($image, 64 + $i, 1, substr($message_bits, $i, 1));
}

open my $out_fh, ">", $output_image or die $!;
binmode $out_fh;
print $out_fh $image;
close $out_fh;
