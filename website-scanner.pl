use LWP::UserAgent;

sub scan {
    my $url = shift;
    my $file = shift;
    my $ua = LWP::UserAgent->new;
    my $response = $ua->get($url . $file);
    
    if ($response->is_success) {
        print "    ✔️✔️ $file found at $url ✔️✔️\n";
    } else {
        print " ✖️✖️ $file not found at $url ✖️✖️\n";
    }
}

# usage
print " [*] Enter the website URL (e.g. http://example.com): ";
my $website = <STDIN>;
chomp $website;
my @files = ("/index.html", "/secret_file.txt", "/directory/");
foreach my $file (@files) {
    scan($website, $file);
}
