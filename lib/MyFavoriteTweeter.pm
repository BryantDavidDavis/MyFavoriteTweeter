package MyFavoriteTweeter;
use Dancer2;
use MySecretKeys;
use APITransformer;
use Net::Twitter;
use Scalar::Util 'blessed';
use Data::Dumper;
use Array::Utils;
use TwitterHandler;

set serializer => 'JSON';
our $VERSION = '0.1';

get '/' => sub {
    return "successful";
};

prefix '/api/1.0' => sub {

    if ( my $err = $@ ) {
        die $@ unless blessed $err && $err->isa('Net::Twitter::Error');
        warn "HTTP Response Code: ", $err->code, "\n",
             "HTTP Message......: ", $err->message, "\n",
             "Twitter error.....: ", $err->error, "\n";
    }

    get '/tweets/:name' => sub {
        my $r = TwitterHandler::get_tweets(params->{name});
        my @transformedTweets = APITransformer::transform_tweets(@{$r});
        return [@transformedTweets];
    };

    get '/intersection/:one/:two' => sub {
        my $names_array = TwitterHandler::get_intersection(params->{one}, params->{two});
        return [APITransformer::transform_users(@{$names_array})];
    };
};

true;
