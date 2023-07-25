#!/usr/bin/python3
"""consume an Api and parse the data returned to print
the completed tasks
"""

import csv
from sys import argv
import requests


if __name__ == "__main__":
    if len(argv) == 2:
        id = argv[1]
        url = f"https://jsonplaceholder.typicode.com/users/{id}"
        user = requests.get(url).json()
        todos = requests.get(f"{url}/todos").json()
        with open(f"{id}.csv", 'w', newline='') as csvfile:
            fieldnames = ["userId", "username", "completed", "title"]
            writer = csv.DictWriter(csvfile,
                                    fieldnames=fieldnames,
                                    quotechar='"', quoting=csv.QUOTE_ALL)
            for todo in todos:
                todo["username"] = user["username"]
                del todo["id"]
                writer.writerow(todo)
