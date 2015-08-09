package APITransformer;
use strict 'vars';
use warnings;
use Data::Dumper;


sub transform_tweets {
    my (@unformatted) = @_;

    my @outputArray;

    for my $status (@unformatted) {
        push @outputArray, {
            text => $status->{text},
            created_at => $status->{created_at},
            screen_name => $status->{user}{screen_name}
        };
    }

    return @outputArray;
}

1;
