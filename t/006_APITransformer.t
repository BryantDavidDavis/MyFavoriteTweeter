use strict 'vars';
use warnings;

use MyFavoriteTweeter;
use APITransformer;
use Data::Dumper;
use Test::More tests => 2;

my $test_tweet = {
                   'id' => '630153765174120448',
                   'user' => {
                               'screen_name' => 'bryantdavis2014',
                               'profile_background_image_url' => 'http://abs.twimg.com/images/themes/theme1/bg.png',
                               'friends_count' => 52,
                               'created_at' => 'Wed Oct 08 19:27:00 +0000 2014',
                               'profile_sidebar_fill_color' => 'DDEEF6',
                               'statuses_count' => 2,
                               'id' => 2816509353,
                               'name' => 'Bryant Davis',
                               'id_str' => '2816509353',
                               'followers_count' => 5,
                             },
                   'created_at' => 'Sat Aug 08 23:08:59 +0000 2015',
                   'text' => 'Hello, from the world of Perl!',
                   'favorite_count' => 1
};

my $expected_transformed_tweet = "{
    'created_at' : 'Sat Aug 08 23:08:59 +0000 201',
    'text' : 'Hello, from the world of Perl!',
    'screen_name' : 'bryantdavis2014'
}";

my $test_users = [{'location' => '642 Clement Street','screen_name' => 'rrdraughthouse'}, {'location' => '643 Clement Street', 'screen_name' => 'helloworld'}];

my $expected_transformed_users = "[{'screen_name':'rrdraughthouse'},{'screen_name':'helloworld'}]";

ok( APITransformer::transform_tweets($test_tweet), $expected_transformed_tweet);

ok( APITransformer::transform_tweets(@{$test_users}), $expected_transformed_users);

