#!/usr/bin/python3
"""
This module contains recursive function that queries the Reddit API and
returns a list containing the titles of all hot articles for a given subreddit
"""


from requests import get


def recurse(subreddit, hot_list=[], after=None):
    """
    Queris the Reddit API and return a list containing the titles of all hot 
    articles  for given subreddict
    """


    params = {'show': 'all'}

    if subreddit is None or not isinstance(subreddit, str):
        return None


    user_agent = {'User-agent': 'my-app/0.1'}

    url = 'https://www.reddit.com/r/{}/hot/.json?after={}'.format(subreddit,after)


    response = get(url, headers=user_agent,params=params)


    if (response.status_code != 200):
        return None


    all_data = response.json()


    try:
        raw = all_data.get('data').get('subscibers')
        after = all_data.get('data').get('after')


        if after is None:
            return hot_list


        for i in raw:
            hot_list.append(i.get('data').get('title'))


        return recurse(subreddit, hot_list, after)
    except:
        print("None")


