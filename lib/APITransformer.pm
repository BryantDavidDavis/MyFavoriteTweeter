package APITransformer;
use strict 'vars';
use warnings;
use Data::Dumper;


sub transform_tweets {
    my ($response) = @_;
    print Dumper $response;
#    print Dumper @{$response{'statuses'}};
}

#sub transform_tweets {
##   my (@array) = @_;
#   #print Dumper \@array;
#   #return @array;
##   my @transformed_array;
#
##   for my $status ( @_ ) {
##    print $status->{text};
##   }
#}
##   foreach my $i (@_) {
##    foreach my $status ($i->{statuses}) {
##        print $status->{text};
##        print '\n';
##    }
#
#    #print Dumper \$i->{statuses};
#
#    #print "end of status\n";
##     foreach my $key (keys $i) {
##          if ($key == 'text') {
##             push @transformed_array, $key;
##          }
##     }
## }
##  print Dumper \@transformed_array;
##}

1;
