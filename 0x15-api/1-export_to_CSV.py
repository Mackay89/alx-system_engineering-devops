#!/usr/bin/python3
"""
This script export data in the CSV format.
"""


import csv
import requests
import sys


if __name__ == "__main__":
    user_id = sys.argv[1]

    
    response = requests.get("https://jsonplaceholder.typicode.com/users/{user_id}")
    name = response.json().get('username')
    todos = requests.get('https://jsonplaceholder.typicode.com/todos')


    file_name = f"{user_id}.csv"
    with open(file_name, mode='w', newline='') as f:
        writer = csv.writer(f, delimiter=',', quotechar='"',
                quoting=csv.QUOTE_ALL, lineterminator='\n')
        for task in todos.json():
            if task.get('userId') == int(user_id):
                writer.writerow([user_id, name, str(task.get('completed')),
                    task.get('title')])
