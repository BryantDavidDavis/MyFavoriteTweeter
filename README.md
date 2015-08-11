# MyFavoriteTweeter


API Usage Instructions:

This is version 1.0 of the MyFavoriteTweeter API.  This version of the API has two main actions.
1. A caller to the API can get a list of the most recent tweets of a user by calling the API service as so:
  http://50.116.0.57:6500/api/1.0/tweets/sometwitterusername
2. A caller to the API can get the intersection of two users' friends (the people they follow on Twitter) by calling the API as so:
  http://50.116.0.57:6500/api/1.0/intersection/userA/userB
  
The results are returned as JSON.

Note:
  The Twitter API rate limits, which means that during a 15 minute window this API can only make a certain number of requests.
  As a Result, if the caller wishes to find the intersection of Twitter Users with many friends (e.g. TheEllenShow), they may find themselves rate-limited.


Build Instructions:

In order to Deploy this App on a Linux Distrobution such as Ubuntu 14.04 (which is what this API is running on), one must ensure that they have installed the appropriate perl dependencies first.  This app was deployed on a fresh Ubuntu 14.04 distrobution by following these steps:
1. first clone this git repo into the directory of your choosing on your server
2. In order to install a c compiler, run:
  $ sudo apt-get update
  $ sudo apt-get upgrade
  $ sudo apt-get install build-essential
3. next you should install support for the cpan module SLLeay by running:
  $ sudo apt-get install libssl-dev
4. next you can follow this tutorial on setting up carton to manage your perl dependencies
  http://kappataumu.com/articles/modern-perl-toolchain-for-web-apps.html
  This will ensure that you have the tools necessary to install the project dependecies.
5. now run carton install to install your dependencies (google any error messages that occur during installation :))
6. now you must create a file called MySecretKeys.pm to store you application's Twitter authentication keys
The file should look like this:
<div>

<p>package MySecretKeys;</p>
<p>use strict 'vars';</p>
<p>use warnings;</p>

our $consumer_key = 'blablabla';
our $consumer_secret = 'blablabla';
our $access_token = 'balbalbal';
our $access_token_secret = 'blablabla';
</div>
Of course it is probably better to store these as $ENV variables if you wish

7. Now simply serve your project with from the port of your choosing with the command:
  carton exec starman -p 8080 MyFavoriteTweeter.psgi
