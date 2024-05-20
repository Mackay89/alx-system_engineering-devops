#!/usr/bin/python3
"""
This script export data in the CSV format.
"""


import json
import requests
import sys


if __name__ == "__main__":
    user_id = sys.argv[1]


    response = requests.get("https://jsonplaceholder.typicode.com/users/{}".
    format(user_id))
    todos = requests.get("https://jsonplaceholder.typicode.com/todos").json()


    task_list = []


    for task in todos:
        if task.get('user_Id') == int(user_id):
            task_dict = {"task": task.get('title'),
                    "completed": task.get('completed'),
                    "username": user.json().get('username')}
            task_list.append(task_dict)


    todo_user = {user_id: task_list}


    file_name = f"{user_id}.json"
    with open(file_name, mode='w') as f:
        json.dump(todo_user, f)

