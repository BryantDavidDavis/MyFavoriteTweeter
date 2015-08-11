use strict;
use warnings;

use MyFavoriteTweeter;
use MyFavoriteTweeter;
use Test::More tests => 1;
use Plack::Test;
use HTTP::Request::Common;

#my $app = MyFavoriteTweeter->to_app;

#my $test1 = Plack::Test->create($app);
#my $test2 = Plack::Test->create($app);

#my $tweets  = $test1->request( GET '/api/1.0/tweets/bryantdavis2014' );
#my $intersection = $test2->request( GET '/api/1.0/intersection/bryantdavis2014/rrdraughthouse');

#ok( $tweets->is_success, '[GET /] successful' );
#ok( $intersection->is_success, '[GET /] successful' );

test_psgi
    app => sub {
        my $env = shift;
        return [ 200, [ 'Content-Type' => 'text/plain' ], [ "It Works"] ],
    },
    client => sub {
        my $cb  = shift;
        my $req = HTTP::Request->new(GET => "http://localhost/tweets/");
        my $res = $cb->($req);
        like $res->content, qr/It Works/;
    };
