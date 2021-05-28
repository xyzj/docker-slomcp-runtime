#!/usr/bin/env python3

# for shld

import sys
import os
import time
from extsvr import SVR_STOP, SVR_START

default_list = [
    "back", "uas", "asset", "gis", "logger", "dm", "msgpush", "task", "uiact","dpwlst"]

if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.argv[1] != "-y":
            default_list = sys.argv[1:]
    else:
        ans = input("do you want restart all the services? (y/n)")
        if ans.lower() != "y":
            exit(0)
    print("restart servers: " + ", ".join(default_list) + "\n")
    for s in default_list:
        print("--> stop server: " + s)
        os.system(SVR_STOP[s])
        time.sleep(1)
        print("--> start server: " + s)
        os.system(SVR_START[s])
        time.sleep(1)
