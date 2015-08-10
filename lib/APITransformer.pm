package APITransformer;
use strict 'vars';
use warnings;
use Data::Dumper;


sub transform_tweets {
    my (@unformatted) = @_;

    my @output_array;

    for my $status (@unformatted) {
        push @output_array, {
            text => $status->{text},
            created_at => $status->{created_at},
            screen_name => $status->{user}{screen_name}
        };
    }

    return @output_array;
}

sub transform_users {
    my (@users) = @_;

    my @output_array;



    for my $user (@users) {
        print Dumper $user;
        push @output_array, {
            screen_name => $user->{screen_name}
        };
    }

    return @output_array;
}

1;
