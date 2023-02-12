#!/usr/bin/perl
use strict;
use warnings;
use Image::ExifTool;

my $file = shift or die "Usage: $0 file.jpg\n";

my $exif = new Image::ExifTool;
my $metadata = $exif->ImageInfo($file);

foreach my $key (keys %{$metadata}) {
    printf "%-20s %s\n", $key, $metadata->{$key};
}
