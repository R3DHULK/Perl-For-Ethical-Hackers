#!/usr/bin/perl
use strict;
use warnings;
use Image::ExifTool;

my $file = shift or die "Usage: $0 file.jpg\n";

my $exif = new Image::ExifTool;
$exif->SetNewValue(all => undef);
$exif->WriteInfo($file);
