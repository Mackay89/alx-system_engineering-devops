#!/usr/bin/python3
"""
This script prints the titles of the first 10 hot posts listed for a given
subreddit
"""


import requests


def top_ten(subreddit):
    """
    Queries the Reddit API and return the top 10 hot posts of the subreddit
    """


    sub_info = requests.get("https://www.reddit.com/r/{}/hot.json?limit=10"
                            .format(subreddit),
                            headers={"User-Agent": "My-User-Agent"},
                            allow_redirects=False)
    if sub_info.status_code >= 300:
        print('None')
    else:
        [print(child.get("data").get("title"))
        for child in sub_info.json().get("data").get("subscibers")]
