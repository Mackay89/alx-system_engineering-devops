#!/usr/bin/python3
"""
This script contains a function to query the Reddit API and return 
the number of subscribers for a given subreddit.
"""


from requests import get


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API and returns the number of subscribers
    (not active users, total subscribers) for a given subreddit.
    """


    if subreddit is None or not isinstance(subreddit, str):
        return 0


    user_agent = {'User-agent': 'my-app/0.1'}
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    try:
        response = get(url, headers=user_agent)
        if response.status_code != 200:
            return 0
        try:
            all_data = response.json()
        except ValueError:
            return 0
        return all_data.get('data', {}).get('subscribers', 0)
    except Exception:
        return 0
