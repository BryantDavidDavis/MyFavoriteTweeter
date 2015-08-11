use strict;
use warnings;

use MyFavoriteTweeter;
use TwitterHandler;
use Test::More tests => 1;
use Plack::Test;
use HTTP::Request::Common;

my $app = MyFavoriteTweeter->to_app;
is( ref $app, 'CODE', 'Got app' );

my $test = Plack::Test->create($app);