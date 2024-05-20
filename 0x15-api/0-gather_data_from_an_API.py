#!/usr/bin/python3
"""
This script that, using this REST API, for given employee Id,
returns information about his/her TODO list progress.
"""


import requests
import sys


if __name__ == "__main__":
    employeeID = sys.argv[1]
    base_url = "https://jsonplaceholder.typicode.com/users"
    url = base_url + "/" + employeeID


    user_response = requests.get(url)
    employeeName = user_response.json().get('name')


    todo_url = url + "/todos"
    user_response = requests.get(todo_url)
    tasks = user_response.json()
    complete = 0 
    complete_tasks = []


    for task in tasks:
        if task.get('completed'):
            complete_tasks.append(task)
            complete += 1


    print("Employee {} is done with tasks({}/{}):".format
            (employeeName, complete, len(tasks)))


    for task in complete_tasks:
        print("\t {}".format(task.get('title')))

