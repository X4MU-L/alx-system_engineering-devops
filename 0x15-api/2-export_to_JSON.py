#!/usr/bin/python3
"""consume an Api and parse the data returned to print
the completed tasks
"""

import json
from sys import argv
import requests


if __name__ == "__main__":
    if len(argv) == 2:
        id = argv[1]
        url = f"https://jsonplaceholder.typicode.com/users/{id}"
        user = requests.get(url).json()
        todos = requests.get(f"{url}/todos").json()
        new_json = {}
        new_json[user["id"]] = []
        for todo in todos:
            new_data = {}
            new_data.update(task=todo["title"],
                            completed=todo["completed"],
                            username=user["username"]
                            )
            new_json[user["id"]].append(new_data)
        with open(f"{id}.json", 'w') as f:
            json.dump(new_json, f)
