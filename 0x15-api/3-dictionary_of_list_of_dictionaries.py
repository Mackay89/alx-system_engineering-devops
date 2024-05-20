#!/usr/bin/python3
"""
This script experts data in the JSON format.
"""


import json
import requests
import sys


if __name__ == "__main__":
    users_response = requests.get("https://jsonplaceholder.typicode.com/users")
    users = users_response.json()


    todos_response = requests.get("https://jsonplaceholder.typicode.com/todos")
    todos = todos_response.json()


    todo_all = {}


    for user in users:
        task_list = []
        for task in todos:
            if task.get('userId') == user.get('id'):
                task_dict = {"username": user.get('username'),
                        "task": task.get('title'),
                        "completed": task.get('completed')}
                task_list.append(task_dict)
    todo_all[user.get('id')] = task_list


with open('todo_all_employees.json', mode='w') as f:
    json.dump(todo_all, f, indent=4)

