#!/usr/bin/python3
"""
This script contains a function to query the Reddit API and return 
the number of subscribers for a given subreddit.
"""


import requests


def number_of_subscribers(subreddit):
    """
    Queries the Reddit API and returns the number of subscribers for a given subreddit.
    """
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'my-app/0.1'}
    try:
        response = requests.get(url, headers=headers)
        if response.status_code == 200:
            data = response.json()
            return data.get('data', {}).get('subscribers', 0)
        else:
            return 0
    except requests.RequestException:
        return 0


if __name__  == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: ./0-subs.py <subreddit>")
    else:
        subreddit = sys.argv[1]
        print(number_of_subscribers(subreddit))
