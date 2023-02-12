#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;

# Create a new user agent object
my $ua = LWP::UserAgent->new;

# Set the user agent
$ua->agent("My Web Scraper");

# Get the target URL
my $url = "https://www.example.com";

# Send the request
my $response = $ua->get($url);

# Check for success
if ($response->is_success) {
    # Extract the content
    my $content = $response->content;
    # Do something with the content
    print $content;
} else {
    # Print the error
    print $response->status_line;
}
