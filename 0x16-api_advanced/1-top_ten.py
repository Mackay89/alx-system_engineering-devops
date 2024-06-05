#!/usr/bin/python3
"""
This script prints the titles of the first 10 hot posts listed for a given
subreddit
"""


from requests import get


def top_ten(subreddit):
    """
    Queries the Reddit API and prints the titles of the first
    10 hot posts listed for a given subreddit
    """


    if subreddit is None or not isinstance(subreddit, str):
        print("None")
        return 


    user_agent = {'User-agent': 'my-app/0.1'}
    params = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'.format(subreddit)


    response = get(url, headers=user_agent, params=params)


    if response.status_code != 200:
        print("None")
        return


    try:
        all_data = response.json()
        raw = all_data.get('data', {}).get('children', [])


        if not raw:
            print("None")
            return


        for item in raw:
            print(item.get('data', {}).get('title', "None"))


    except Exception:
        print("None")


if __name__ == "__main__":
    topten('python')
