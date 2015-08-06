package MyFavoriteTweeter;
use Dancer2;

our $VERSION = '0.1';

prefix '/api/1.0' => sub {
    get '/' => sub {
        return 'hello my fellow friends';
    };
};

true;
