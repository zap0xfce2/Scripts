#!/usr/bin/perl -w
use LWP::UserAgent;
use HTML::LinkExtor;
use URI::URL;

# Pfad zur Seite
$url = "http://download.openoffice.org/other.html";  # for instance
$ua = LWP::UserAgent->new;

  # Set up a callback that collect the links
  my @imgs = ();
  sub callback {
     my($tag, %attr) = @_;
     return if $tag ne 'a';  # we only look closer at <a ...>
     push(@imgs, values %attr);
  }

# Make the parser.  Unfortunately, we don't know the base yet
# (it might be diffent from $url)
$p = HTML::LinkExtor->new(\&callback);

# Request document and parse it as it arrives
$res = $ua->request(HTTP::Request->new(GET => $url),sub {$p->parse($_[0])});

# Expand all image URLs to absolute ones
my $base = $res->base;
@imgs = map { $_ = url($_, $base)->abs; } @imgs;

# Ausgabe
print join("\n", @imgs), "\n";




