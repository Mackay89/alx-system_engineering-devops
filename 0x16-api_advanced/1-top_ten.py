#!/usr/bin/python3
"""
This script prints the titles of the first 10 hot posts listed for a given
subreddit
"""


import requests


def top_ten(subreddit):
    """
    Queries the Reddit API and prints the titles of the first
    10 hot posts listed for a given subreddit
    """


    if subreddit is None or not isinstance(subreddit, str):
        print("None")


    user_agent = {'User-agent': 'my-app/0.1'}
    params = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'.format(subreddit)


    response = get(url, headers=user_agent, params=params)
    all_data = response.json()


    try:
        raw = all_data.get('data').get('subscibers')


        for i in raw:
            print(i.get('data').get('title'))


    except:
        print("None")

