#!/usr/bin/python3
"""consume an Api and parse the data returned to print
the completed tasks
"""

import json
from sys import argv
from urllib import request


def task_done(todos):
    """get the number of task done from a todo list
    """
    done = 0
    for todo in todos:
        if todo["completed"]:
            done += 1
    return done


if __name__ == "__main__":
    if len(argv) == 2:
        url = f"https://jsonplaceholder.typicode.com/users/{argv[1]}"
        with request.urlopen(url) as user_request:
            user = json.loads(user_request.read())
        with request.urlopen(f"{url}/todos") as req:
            todos = json.loads(req.read())
            print("Employee {} is done with tasks({}/{})"
                  .format(user["name"], task_done(todos), len(todos)))
            for todo in todos:
                if todo["completed"]:
                    print("\t {}".format(todo["title"]))
