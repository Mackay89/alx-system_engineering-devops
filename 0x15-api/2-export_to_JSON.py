#!/usr/bin/python3
"""
This script export data in the CSV format.
"""


import json
import requests
import sys


if __name__ == "__main__":
    user_id = sys.argv[1]
    url = "https://jsonplaceholder.typicode.com/"


    user = requests.get(url + "users/{}".format(user_id)).json()
    username = user.get("username")


    params = {"userId": user_id}
    todos = requests.get(url + "todos", params).json()

    data_to_export = {
            user_id: [
                {
                    "task": t.get("title"),
                    "completed": t.get("completed"),
                    "username": username
                }
                for t in todos
            ]
        }

        
    # Write the data to JSON file with the employee ID as the filename
    with open("{}.json".format(user_id), "w")as jsonfile:
        json.dump(data_to_export, jsonfile, indent=4)

