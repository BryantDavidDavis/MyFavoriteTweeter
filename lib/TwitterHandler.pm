package TwitterHandler;
use Dancer2;
use MySecretKeys;
use APITransformer;
use Net::Twitter;
use Scalar::Util 'blessed';
use Data::Dumper;
use Array::Utils;

#authentication_keys belong in $ENV variables
my $nt = Net::Twitter->new(
    traits   => [qw/API::RESTv1_1/],
    consumer_key        => $MySecretKeys::consumer_key,
    consumer_secret     => $MySecretKeys::consumer_secret,
    access_token        => $MySecretKeys::access_token,
    access_token_secret => $MySecretKeys::access_token_secret,
);

sub get_tweets {
    my ($user_name) = @_;

    return $nt->user_timeline({screen_name => $user_name});
}

sub get_intersection {
    my ($user_one, $user_two) = @_;
    my @ids_one;
    my @ids_two;

    for ( my $cursor = -1, my $r; $cursor; $cursor = $r->{next_cursor} ) {
        $r = $nt->friends_ids({screen_name => $user_one, cursor => $cursor });
        push @ids_one, @{$r->{ids} };
    }

    for ( my $cursor = -1, my $r; $cursor; $cursor = $r->{next_cursor} ) {
        $r = $nt->friends_ids({screen_name => $user_two, cursor => $cursor });
        push @ids_two, @{$r->{ids} };
    }

#    print Dumper @ids_two;
    my @ids_array = Array::Utils::intersect(@ids_one, @ids_two);
    my $names_array = $nt->lookup_users({user_id => @ids_array});
    return $names_array;
}

1;