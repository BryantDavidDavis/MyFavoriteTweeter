package MyFavoriteTweeter;
use Dancer2;
use MySecretKeys;
use APITransformer;
use Net::Twitter;
use Scalar::Util 'blessed';
use Data::Dumper;
use Array::Utils;

set serializer => 'JSON';
our $VERSION = '0.1';

my $nt = Net::Twitter->new(
    traits   => [qw/API::RESTv1_1/],
    consumer_key        => $MySecretKeys::consumer_key,
    consumer_secret     => $MySecretKeys::consumer_secret,
    access_token        => $MySecretKeys::access_token,
    access_token_secret => $MySecretKeys::access_token_secret,
);

prefix '/api/1.0' => sub {

        get '/user-tweets/:name' => sub {
            my $r = $nt->search(params->{name});
            if ( my $err = $@ ) {
                die $@ unless blessed $err && $err->isa('Net::Twitter::Error');
                    warn "HTTP Response Code: ", $err->code, "\n",
                         "HTTP Message......: ", $err->message, "\n",
                         "Twitter error.....: ", $err->error, "\n";
            }

            my @transformedTweets = APITransformer::transform_tweets(@{$r->{statuses}});
            return [@transformedTweets];
        };

        get '/following-intersection/:one/:two' => sub {
            my $one_result = $nt->friends_list({screen_name => params->{one}});
            my $two_result = $nt->friends_list({screen_name => params->{two}});

            my @first_friends;
            my @second_friends;

            for my $friend (@{$one_result->{users}}) {
#                print Dumper $friend->{screen_name};
                push @first_friends, $friend->{screen_name};
            }

            for my $friend (@{$two_result->{users}}) {
                push @second_friends, $friend->{screen_name};
            }

            my @output_array = Array::Utils::intersect(@first_friends, @second_friends);
            return [@output_array];
        };
};

true;
