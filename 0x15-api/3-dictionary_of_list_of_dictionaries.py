#!/usr/bin/python3
"""consume an Api and parse the data returned to print
the completed tasks
"""

import json
from sys import argv
import requests


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/users"
    todo_url = "https://jsonplaceholder.typicode.com/users/{}/todos"
    allusers = requests.get(url).json()
    all_json = {}
    for user in allusers:
        id = user['id']
        todos = requests.get(todo_url.format(id)).json()
        all_json[id] = []
        for todo in todos:
            new_data = {}
            new_data.update(task=todo["title"],
                            completed=todo["completed"],
                            username=user["username"]
                            )
            all_json[id].append(new_data)
    with open(f"todo_all_employees.json", 'w') as f:
        json.dump(all_json, f)
