# MyFavoriteTweeter

API:

This is version 1.0 of the MyFavoriteTweeter API.  This version of the API has two main actions.
1. A caller to the API can get a list of the most recent tweets of a user by calling the API service as so:
  http://50.116.0.57:6500/api/1.0/tweets/sometwitterusername
2. A caller to the API can get the intersection of two users' friends (the people they follow on Twitter) by calling the API as so:
  http://50.116.0.57:6500/api/1.0/intersection/userA/userB
  
The results are returned as JSON.

Note:
  The Twitter API rate limits, which means that during a 15 minute window this API can only make a certain number of requests.
  As a Result, if the caller wishes to find the intersection of Twitter Users with many friends (e.g. TheEllenShow), they may find themselves rate-limited.
