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
    url = "https://www.reddit.com/r/{}/about.json"
    try:
        response = get(url, headers=user_agent, allow_redirects=False)
        if response.status_code != 200:
            return 0
        

        all_data = response.json()
        return all_data.get('data', {}).get('subscribers', 0)
    except (ValueError, KeyError):
        return 0
    except Exception:
        return 0
